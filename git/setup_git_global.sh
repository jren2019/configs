#! /bin/bash

# link global flake8 config
if [ ! -d "~/.config/" ]; then
    mkdir ~/.config/
fi

# link global git ignore
ln -sf $HOME/local_install/configs/git/git_ignore_global ~/.gitignore_global

# link git config
ln -sf $HOME/local_install/configs/git/gitconfig ~/.gitconfig
