# bash_env

## Description
It's the settings for bash enviroment with auto-updating by anacron from gitrepo.

## Install
* clone:
  `cd ~ && git clone https://github.com/snaiffer/bash_env.git .bash_env`
* install:
  `sudo ~/.bash_env/install.sh`
  We need `sudo` for anacron.

## Install for other users with gnome-terminal:
* login as <new_user>
  `rm .bashrc .bash_profile`
*  open terminal/Edit/Profile Preferences/Title and Command/Run command as a login shell

## Settings update
This script has auto-update by anacron from gitrepo, but you can run manual-update:
`git -C ~/.bash_env pull`
