# GitHub Multiple Fork Synchronization Script

This Bash script automates the process of synchronizing multiple forked repositories on GitHub with their original repositories (upstream), at once. It uses the GitHub API and Git commands to fetch updates from the upstream repository, merge them into the local fork, and push the changes back to the remote fork.

## Prerequisites

Before using this script, ensure that you have the following:

- Bash: The script is designed to run on a Bash shell.
- cURL: The command-line tool `curl` is required to make API requests.
- Git: Git is used for cloning, fetching, merging, and pushing repositories.

## Setup

1. Clone the repository or copy the script to your local machine.
2. Open the script file (`sync_multiple_forks.sh`) in a text editor.
3. Replace the placeholder values with your GitHub username and access token:
    - `[YOUR_USERNAME]`: Replace this with your GitHub username.
    - `[YOUR_ACCESS_TOKEN]`: Replace this with your GitHub personal access token. Ensure the token has the necessary permissions to access the GitHub API.
4. Save the changes and run it.

he script will execute and start synchronizing the forked repositories.

Iterates through each forked repository and performs the following actions:
- Clone the forked repository locally.
- Add the original repository (upstream) as a remote.
- Fetch updates from the upstream repository.
- Merge the changes from the upstream repository into the local fork.
- Push the merged changes to the remote fork.
- Clean up by removing the cloned repository from the local machine.

## Notes
- This script assumes that you have the necessary permissions to clone, fetch, merge, and push repositories on GitHub.
- Ensure that you review and understand the script before running it. It will modify repositories on your local machine and push changes to your GitHub account.
- Make sure that your GitHub personal access token is valid and has the required permissions to access the GitHub API.
- If an upstream repository is not found for a fork, the script will display a "no upstream found" message.
- The script requires an active internet connection to access the GitHub API and clone repositories.

## Disclaimer
Use this script at your own risk. The script is provided as-is without any warranty. Always double-check the script and its actions before running it, especially when it involves modifying repositories and pushing changes.

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or create a pull request.
