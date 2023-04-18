#!/bin/bash

### Lists of packages to be installed ###
pkgs='vim tmux git stow mc python3-venv python3-pip awscli lvm2 cryptsetup oathtool p7zip-full cifs-utils'
gui='keepassxc redshift-gtk vinagre python3-tk ubuntu-restricted-extras'
virt='virtualbox virtualbox-ext-pack vagrant'
i3='i3 lxappearance feh compton rofi arandr xdotool'
srv='lamp-server^ phpmyadmin libapache2-mod-wsgi-py3'

sudo apt update
sudo apt -y install $pkgs $gui $i3 $virt $srv


### Pull down dotfiles repo ###
cd ~
git clone https://github.com/bmsurber/dotfiles


### Intall Vim plugins ###
cd ~/dotfiles/vim/.vim/pack/plugins/start
git clone https://github.com/bmsurber/gruvbox
git clone https://github.com/bmsurber/emmet-vim


### Create symlinks in home ###
for pkg in *; do
    if [ -d "$pkg" ]; then
        stow -v "$pkg"
    fi
done

cd ~
source .bash_aliases
