#!/bin/bash

DOT_SCRIPTS_FOLDER=`pwd`
read -p "What's your WINDOWS User Folder Name? " WINDOWS_USER_FOLDER
PREFIX="[DOT-WSL]"

echo "$PREFIX UPDATING SOME IMPORTANT FOLDER"
tar -zxvf config/utilities.tar.gz ~/utilities

echo "$PREFIX UPDATING SOME IMPORTANT CONFIG"
tar -zxvf config/hyper.tar.gz /mnt/c/Users/$WINDOWS_USER_FOLDER/AppData/Roaming/

echo "$PREFIX UPDATING .DOT-FILES"
cp config/.bashrc ~/.
cp config/.profile ~/.
cp config/.zshrc ~/.
#cp config/.gitconfig ~/.

echo "$PREFIX UPDATING ZSH-THEME"
cp config/dieter.zsh-theme ~/.oh-my-zsh/themes/

echo "$PREFIX UPDATING YARN PACKAGE.JSON"
cp config/yarn-package.json ~/.config/yarn/global/package.json
