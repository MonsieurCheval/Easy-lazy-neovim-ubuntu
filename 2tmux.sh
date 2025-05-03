#!/bin/bash


echo "=== Installing essential dependencies ==="
sudo apt install -y \
    tmux

echo "unbind C-b" >> /home/tun/.tmux.conf #USERNAME HERE 
echo "set-option -g prefix M-a" >> /home/tun/.tmux.conf #USERNAME HERE 
echo "bind-key M-a send-prefix" >> /home/tun/.tmux.conf #USERNAME HERE 