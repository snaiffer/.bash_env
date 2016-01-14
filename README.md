# bash_env

## Description
Settings for bash enviroment with auto-updating by cron from gitrepo.

## Install
1. clone gitrepo:

  ```sh
  cd ~ && git clone https://github.com/snaiffer/bash_env.git .bash_env
  ```
1. install:

  ```sh
  sudo ~/.bash_env/install.sh
  ```
  We need `sudo` for cron and for editing `/etc/profile`.

## Install for other users with gnome-terminal:
1. login as other user

  ```sh
  rm .bashrc .bash_profile
  ```
1.  open `terminal/Edit/Profile Preferences/Title and Command/Run command as a login shell`

## Settings update
This script has auto-update by cron from gitrepo, but you can run manual-update:

```sh
git -C ~/.bash_env pull
```
