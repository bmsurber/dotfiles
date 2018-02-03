#!/bin/bash

### Lists of packages to be installed ###
pkgs='vim tmux git stow mc python3-venv python3-pip ipython3 awscli lvm2 cryptsetup oathtool p7zip-full cifs-utils'
gui='keepassx redshift-gtk vinagre python3-tk xubuntu-restricted-extras'
virt='virtualbox virtualbox-ext-pack vagrant'
i3='i3 lxappearance feh compton j4-dmenu-desktop'
srv='lamp-server^ phpmyadmin libapache2-mod-wsgi-py3'

sudo apt update
sudo apt -y install $pkgs $gui $i3 $virt $srv


### Pull down dotfiles repo ###
cd ~
git clone https://github.com/bmsurber/dotfiles


### Initialize submodules (Vim plugins) ###
cd dotfiles
git submodule update --init

# Uncomment the next two lines to update vim plugins to the latest versions ###
# git submodule foreach git pull origin master
# git submodule foreach git checkout master


### Create symlinks in home ###
for pkg in *; do
    if [ -d "$pkg" ]; then
        stow -v "$pkg"
    fi
done

cd ~
source .bash_aliases
