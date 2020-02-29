#! /bin/bash

# install flake8
pip install flake8

# link global flake8 config
if [ ! -d "~/.config/" ]; then
    mkdir ~/.config/
fi
ln -sf /Users/thomasverbeek/local_install/configs/git/flake8 ~/.config/flake8

pip install isort
ln -sf /Users/thomasverbeek/local_install/configs/git/isort.cfg ~/.isort.cfg

if [ ! -d "~/.git_hooks/" ]; then
    mkdir ~/.git_hooks/
fi
# link pre-commit hook into global commit hook directory
ln -sf /Users/thomasverbeek/local_install/configs/git/pre-commit ~/.git_hooks/pre-commit

# link global git ignore
ln -sf /Users/thomasverbeek/local_install/configs/git/git_ignore_global ~/.gitignore_global

# link git config
ln -sf /Users/thomasverbeek/local_install/configs/git/gitconfig ~/.gitconfig
