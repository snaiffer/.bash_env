#!/bin/bash

echo "Installing... "

# clone:
  cd ~
  # git clone https://github.com/snaiffer/.bash_env.git

export path_gitrepo="`pwd`/.bash_env"
export file_autoupdater="/etc/cron.daily/bashenv"

cat .bashrc | grep bash_env; if [ "$?" = "0" ]; then
  echo -e "It has been already installed\nexit"; exit 0
fi

echo "Making backups of the settings files (with extension .old)... "
  if [ -f .bash_profile ]; then
    cp -f .bash_profile .bash_profile.old
  fi
  if [ -f .bashrc ]; then
    cp -f .bashrc .bashrc.old
  fi

echo "Applying the new settings files... "
# interactive
## a login shell (Ordinary terminal) for one user:
  echo "source $path_gitrepo/bash_env" >> .bash_profile
## a login shell (Ordinary terminal) for all users:
  sudo bash -c ' echo "source $path_gitrepo/bash_env" >> /etc/profile '
## not a login shell (Terminals in X server) for one user:
  echo "source $path_gitrepo/bash_env" >> .bashrc

# non-interactive (shell scripts)
## a login shell (Ordinary terminal) for one user:
  echo "export BASH_ENV=$path_gitrepo/bash_env" >> .bash_profile
## a login shell (Ordinary terminal) for all users:
  sudo bash -c ' echo "export BASH_ENV=$path_gitrepo/bash_env" >> /etc/profile '
## not a login shell (Terminals in X server) for one user:
  echo "export BASH_ENV=$path_gitrepo/bash_env" >> .bashrc

echo -e "\n# Under you can set your own settings\n" >> .bashrc

echo "Setting auto-updating settings from git-repo... "
sudo echo "#!/bin/sh
git -C $path_gitrepo pull && exit 0
" > $file_autoupdater

echo -e "done.\n"
echo -e "NOTE:"
echo -e "\tYour own settigns you can set in the bottom of ~/.bashrc\n"
