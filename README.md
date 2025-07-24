# setup

MacOS setup.

## macos-setup.sh

This script will install

- iterm2 (and import my settings)
- brew
- oh-my-zsh
- [pure theme](https://github.com/sindresorhus/pure)
- [git credentials manager](https://github.com/GitCredentialManager/git-credential-manager/blob/main/README.md)
- [ollama](https://ollama.com/)

Remember to restart iterm2 at the end of the script execution, for the ~/.zshrc file to save.

## hooks

It contains:
- A pre-push hook to avoid pushing to default branches (it's best to set up Github protection, however some edge use cases grant admins bypassing the server protection)

Hooks will be automatically installed as part of the macos-setup.sh script.