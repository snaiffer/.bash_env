# bash_env

## Description
Settings for bash enviroment with auto-updating by anacron from gitrepo.

## Install
* clone gitrepo:

  ```sh
  cd ~ && git clone https://github.com/snaiffer/bash_env.git .bash_env
  ```
* install:

  ```sh
  sudo ~/.bash_env/install.sh
  ```
  We need `sudo` for anacron and for editing `/etc/profile`.

## Install for other users with gnome-terminal:
* login as other user

  ```sh
  rm .bashrc .bash_profile
  ```
*  open `terminal/Edit/Profile Preferences/Title and Command/Run command as a login shell`

## Settings update
This script has auto-update by anacron from gitrepo, but you can run manual-update:

```sh
git -C ~/.bash_env pull
```
