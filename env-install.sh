#!/bin/bash

DOT_SCRIPTS_FOLDER=`pwd`
read -p "What's your WINDOWS User Folder Name? " WINDOWS_USER_FOLDER
APT_GET_PROGRAMS='git zsh python3-distutils mlocate python3-pip screen dox2unix'
PREFIX="[DOT-WSL]"

for program in $APT_GET_PROGRAMS;
do
 echo "$PREFIX INSTALLING PROGRAM $program IN YOUR MACHINE USING APT-GET:"
 sudo apt-get install $program -y
 echo "$PREFIX INSTALLED $program"
done

echo "$PREFIX INSTALLING OH-MY-ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "$PREFIX INSTALLING NODEJS"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "$PREFIX INSTALLING YARN"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "$PREFIX INSTALLING DENO"
curl -fsSL https://deno.land/x/install/install.sh | sh

#echo "$PREFIX INSTALLING"
#echo "$PREFIX INSTALLING"

echo "$PREFIX CREATING IMPORTANT FOLDERS"
mkdir ~/learn
mkdir ~/scripts
mkdir ~/utilities
mkdir ~/projects

echo "$PREFIX MOVING SOME IMPORTANT CONFIG AND UTILITIES"
tar -zxvf config/utilities.tar.gz ~/utilities
tar -zxvf config/hyper.tar.gz /mnt/c/Users/$WINDOWS_USER_FOLDER/AppData/Roaming/

echo "$PREFIX MOVING .DOT-FILES TO FOLDERS"
cp config/.bashrc ~/.
cp config/.profile ~/.
cp config/.zshrc ~/.
#cp config/.gitconfig ~/.
cp config/dieter.zsh-theme ~/.oh-my-zsh/themes/
cp config/yarn-package.json ~/.config/yarn/global/package.json

echo "$PREFIX CHANGING DEFAULT SH"
chsh -s $(which zsh)
source ~/.zshrc

echo "$PREFIX DON'T FORGET TO RE-INSTALL ALL GLOBAL YARN PACKAGES"
