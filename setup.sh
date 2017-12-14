#!/bin/bash
pkgs='vim git stow mc keepassx redshift-gtk vinagre python3-venv python3-tk python3-pip ipython3 ipdb awscli lvm2 cryptsetup p7zip-full cifs-utils'
virt='virtualbox virtualbox-ext-pack vagrant'
i3='i3 lxappearance feh compton'
srv='lamp-server^ phpmyadmin libapache2-mod-wsgi-py3'

sudo apt update
sudo apt -y upgrade
sudo apt -y install $pkgs $virt $i3 $srv
cd ~
mv .bash_aliases .bash_aliases.old
git clone https://github.com/bmsurber/dotfiles
cd dotfiles
git submodule update --init
git submodule foreach git pull origin master
git submodule foreach git checkout master
stow *
cd ~
source .bash_aliases
