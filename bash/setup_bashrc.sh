#! /bin/bash

# make bash_profile if it doesn't exist
if [ ! -f "~/.bash_profile" ]; then
    echo source ~/.bashrc > ~/.bash_profile
fi

# link to ~/.bashrc
ln -sf /Users/thomasverbeek/local_install/configs/bash/bashrc ~/.bashrc

pip3 install virtualenvwrapper

source ~/.bash_profile
