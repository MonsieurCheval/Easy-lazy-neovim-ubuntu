#!/bin/bash

sudo apt install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Define the target file
ZSHRC="$HOME/.zshrc"

# Check if the file exists
if [[ -f "$ZSHRC" ]]; then
  # Replace the theme
  sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="jonathan"/' "$ZSHRC"
  echo "ZSH_THEME updated to 'jonathan'."
else
  echo "$ZSHRC not found."
fi