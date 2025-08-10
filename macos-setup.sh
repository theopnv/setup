#!/bin/bash

######## Warmup ########
# set -e # exit on error
set +x # echo commands
pushd $(dirname "$0")

######## zsh ########
## Install
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## Import settings
cp ./com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist


######## brew ########
## Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## Note: In case of multiple users, run subsequent commands with `sudo -Hu <username>`.
## See https://archive.is/n2YAr ("The good: dedicate a single user account to Homebrew")


######## iterm2 ########
## Install
brew install --cask iterm2


######## zsh config ########
## Install pure
brew install pure

## Config pure
cat <<EOF >> ~/.zshrc
autoload -U promptinit; promptinit
prompt pure

export DOTNET_CLI_UI_LANGUAGE=en
EOF
printf "\n" >> ~/.zshrc


######## git ########
brew install --cask git-credential-manager
## Install git hooks
mkdir -p ~/.config/global_git_hooks
cp ./hooks/* ~/.config/global_git_hooks/
git config --global core.hooksPath .config/global_git_hooks

######## ollama ########
read -p "Do you want to install Ollama (local LLM server)? (y/n): " answer
if [[ $answer =~ ^[Yy]$ ]]
then
  brew install --cask ollama
  echo "Reminder: $> ollama serve to start the server, and $> ollama run <model> (e.g. llama3.1) to run a model."
fi


######## Github CLI ########
read -p "Do you want to install Github CLI? (y/n): " answer
if [[ $answer =~ ^[Yy]$ ]]
then
   brew install gh
fi

######## Clean ########
exec $SHELL
popd
set -x
