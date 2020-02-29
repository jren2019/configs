#! /bin/bash

# Link the vimrc:
ln -sf /Users/thomasverbeek/local_install/configs/vim/vimrc ~/.vimrc

# Install Vundle:
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install the plugins:
vim +PluginInstall +qal
