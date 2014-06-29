#!/bin/bash

echo "Intalling..."

# clone:
  cd ~
  # git clone https://github.com/snaiffer/bash_env.git bash_env

# save old settings files
  mv .bash_profile .bash_profile.old 2> /dev/null
  mv .bash_profile .bash_profile.old 2> /dev/null
  mv .bashrc .bashrc.old 2> /dev/null

# interactive  
## a login shell (Ordinary terminal) for one user: 
  echo "source $PWD/bash_env/bash_env" >> .bash_profile
## a login shell (Ordinary terminal) for all users:
  sudo bash -c ' echo "source $PWD/bash_env/bash_env" >> /etc/profile '
## not a login shell (Terminals in X server) for one user:
  echo "source $PWD/bash_env/bash_env" >> .bashrc

# non-interactive (shell scripts)
## a login shell (Ordinary terminal) for one user: 
  echo "export BASH_ENV=$PWD/bash_env/bash_env" >> .bash_profile
## a login shell (Ordinary terminal) for all users:
  sudo bash -c ' echo "export BASH_ENV=$PWD/bash_env/bash_env" >> /etc/profile '
## not a login shell (Terminals in X server) for one user:
  echo "export BASH_ENV=$PWD/bash_env/bash_env" >> .bashrc

echo "done."  
