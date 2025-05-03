#!/bin/bash


echo "=== Installing essential dependencies ==="
sudo apt install -y \
    tmux


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "unbind C-b" >> /home/tun/.tmux.conf #USERNAME HERE 
echo "set-option -g prefix M-a" >> /home/tun/.tmux.conf #USERNAME HERE 
echo "bind-key M-a send-prefix" >> /home/tun/.tmux.conf #USERNAME HERE 

#tmux package manager
echo "set -g @plugin 'tmux-plugins/tpm'" >> /home/tun/.tmux.conf #USERNAME HERE

echo "run ''" >> /home/tun/.tmux.conf #USERNAME HERE
