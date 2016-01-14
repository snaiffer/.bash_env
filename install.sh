#!/bin/bash

echo "Installing... "

# clone:
  cd ~
  # git clone https://github.com/snaiffer/.bash_env.git

export path_gitrepo="`pwd`/.bash_env"
export file_bashenv="$path_gitrepo/bash_env"
export file_autoupdater="/etc/cron.daily/bashenv"
export file_anacrontab="/etc/anacrontab"

# protection of rerun
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
  echo "source $file_bashenv" >> .bash_profile
## a login shell (Ordinary terminal) for all users:
  sudo echo "source $file_bashenv" >> /etc/profile
## not a login shell (Terminals in X server) for one user:
  echo "source $file_bashenv" >> .bashrc

# non-interactive (shell scripts)
## a login shell (Ordinary terminal) for one user:
  echo "export BASH_ENV=$file_bashenv" >> .bash_profile
## a login shell (Ordinary terminal) for all users:
  sudo echo "export BASH_ENV=$file_bashenv" >> /etc/profile
## not a login shell (Terminals in X server) for one user:
  echo "export BASH_ENV=$file_bashenv" >> .bashrc

echo -e "\n# Under you can set your own settings\n" >> .bashrc

echo "Setting auto-updating settings from git-repo... "
# update daily
sudo echo "#!/bin/sh
git -C $path_gitrepo pull > /dev/null && exit 0
" > $file_autoupdater && \
  sudo chmod +x $file_autoupdater
# update at the computer turn on (in 1 minute)
sudo echo -e "@reboot\t1\tbashenv\t$file_autoupdater" >> $file_anacrontab

echo -e "done.\n"
echo -e "NOTE:\tYour own settigns you can set in the bottom of ~/.bashrc\n"
