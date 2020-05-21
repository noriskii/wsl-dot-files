#!/bin/bash

DOT_SCRIPTS_FOLDER=`pwd`

#LINUX_USER_FOLDER=`read -p "What's your Linux "`
read -p "What's your WINDOWS User Folder Name? " WINDOWS_USER_FOLDER 

cd ~ 
  tar -zcvf $DOT_SCRIPTS_FOLDER/config/utilities.tar.gz utilities/
cd -

cd /mnt/c/Users/$WINDOWS_USER_FOLDER/AppData/Roaming/
  tar -zcvf $DOT_SCRIPTS_FOLDER/config/Hyper.tar.gz Hyper/.hyper.js
cd -

cp ~/.bashrc config/
cp ~/.profile config/
cp ~/.zshrc config/
cp ~/.gitconfig config/

cp ~/.oh-my-zsh/themes/dieter.zsh-theme config/
cp ~/.config/yarn/global/package.json config/yarn-package.json

read -p "Save the backup on github? [y/n] " SAVE_ON_GIT

case $SAVE_ON_GIT in
  'y') echo "Saving on Github"; git add .; git commit -m "$(date +'%Y/%m/%d %H:%M') Updating Saved Configs"; git push -u --force origin master;;
  'n') echo "Okay, backup complete at $(date +'%Y/%m/%d %H:%M')";;
  *) echo "Sorry, $SAVE_ON_GIT isn't recognized (doing nothing)";;
esac

