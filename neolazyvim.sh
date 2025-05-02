#!/bin/bash

set -e

echo "=== Updating/Upgrading package lists ==="
sudo apt update
sudo apt upgrade -y

echo "=== Installing essential dependencies ==="
sudo apt install -y \
    git \
    curl \
    ripgrep \
    fzf \
    build-essential \
    unzip \
    unzip \
    lazygit \ 
    fd-find

echo "=== Installing Node.js v22 ==="
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs


mkdir temporary
cd temporary

echo "=== Installing NerdFont==="

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hasklig.zip
unzip Hasklig.zip
mkdir -p ~/.local/share/fonts
mv Hasklig/*.ttf ~/.local/share/fonts
rm -rf Hasklig
fc-cache -fv


echo "=== Installing latest Neovim v0.11 from source ==="
# Remove any system-installed neovim
sudo apt remove -y neovim || true

# Clone Neovim repo and build it
cd ~
rm -rf neovim
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable  # This should track v0.11 if tagged as stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

echo "=== Verifying Neovim version ==="
nvim --version

echo "=== Installing LazyVim config ==="
if [ -d "$HOME/.config/nvim" ]; then
  echo "⚠️  ~/.config/nvim already exists. Skipping LazyVim clone."
else
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

echo "✅ Done! Open Neovim with 'nvim' to finish LazyVim plugin installation."
