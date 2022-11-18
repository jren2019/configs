#! /bin/bash

# Link the vimrc:
ln -sf $HOME/local_install/configs/vim/vimrc ~/.vimrc

# Install Vundle:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
# Install the plugins:
vim +PluginInstall +qal
