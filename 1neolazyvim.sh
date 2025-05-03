#!/bin/bash


#docs
# lazyvim       https://www.lazyvim.org/
#lazyvim.nvim   https://github.com/folke/lazy.nvim
#SETUP NVIM 





LUA_VERSION="5.4.7" #LUA HERE
LUAROCK_VERSION="3.11.1" #LUAROCK HERE
USERNAME="tun"  #USERNAME HERE

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
    fd-find \
    cmake \
    fontconfig



mkdir temporary
cd temporary




echo "=== Installing Lazygit ==="
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION#v}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit # Extract and install
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz   # Cleanup


echo "=== Installing Node.js v22 ==="
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs


echo "=== Installing NerdFont==="
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hasklig.zip
unzip Hasklig.zip
mkdir -p ~/.local/share/fonts
mv *.otf ~/.local/share/fonts
fc-cache -fv
rm * -R






echo "=== Installing LUA version $LUA_VERSION from source ==="
wget http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz
tar -zxf lua-${LUA_VERSION}.tar.gz
cd lua-${LUA_VERSION}
make all test
sudo make install
cd ..
sudo rm * -r






echo "=== Installing LUA ROCK version $LUAROCK_VERSION from source ==="
wget https://luarocks.github.io/luarocks/releases/luarocks-${LUAROCK_VERSION}.tar.gz
tar -zxf luarocks-${LUAROCK_VERSION}.tar.gz
cd luarocks-${LUAROCK_VERSION}
./configure --with-lua-include=/usr/local/include
make
sudo make install
cd ..
sudo rm * -r





git clone https://github.com/neovim/neovim.git
cd neovim
git checkout master
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..
sudo rm * -r





echo "=== Installing Lazyvim ==="
# required
#mv ~/.config/nvim{,.bak}

# optional but recommended
#mv ~/.local/share/nvim{,.bak}
#mv ~/.local/state/nvim{,.bak}
#mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git





ln -s /home/tun/.config/nvim/lua/ /home/tun/nvi #USERNAME HERE
