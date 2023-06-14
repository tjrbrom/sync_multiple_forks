#!/bin/bash

USERNAME="[YOUR_USERNAME]"
ACCESS_TOKEN="[YOUR_ACCESS_TOKEN]"
API_URL="https://api.github.com"

repositories_url="${API_URL}/users/${USERNAME}/repos?type=owner"
response=$(curl -s -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Accept: application/vnd.github.v3+json" "$repositories_url")
fork_urls=$(echo "$response" | jq -r '.[] | select(.fork == true) | .html_url')

readarray -t urls <<<"$fork_urls"

function add_upstream() {
	url=$(git config --get remote.origin.url)
	repoWithOwnerExt=${url#*github.com[/:]}
	repoWithOwner=${repoWithOwnerExt%.git}
	remote=$(curl -s "https://api.github.com/repos/$repoWithOwner" | jq -r '.parent.clone_url')
	if [ "$remote" != "null" ]; then
		git remote add upstream "$remote"
	else
		echo "no upstream found"
	fi
}

# Loop through each fork and update it
for fork in "${urls[@]}"; do
	fork="$fork.git"
	git clone "$fork"
	repo_name=$(basename "$fork" .git)

	cd "$repo_name" || exit

	# need to add the upstream first
	add_upstream

	git fetch upstream

	# upstream branch might not 'master' so we have to get the correct one
	default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')

	git checkout "$default_branch"

	git merge upstream/"$default_branch"

	git push

	cd ..
	rm -rf "$repo_name"
done
