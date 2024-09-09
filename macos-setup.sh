# iterm2
## Install
brew install --cask iterm2

## Import settings
mv ./com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

# zsh
## Install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install pure https://github.com/sindresorhus/pure
brew install pure

## Config pure
echo """
autoload -U promptinit; promptinit
prompt pure

export DOTNET_CLI_UI_LANGUAGE=en
"""" >> ~/.zshrc