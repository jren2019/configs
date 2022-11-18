silent! py3 pass
set number
set nocompatible

if has("syntax")
    syntax on
endif

" Plug
source $HOME/.vim/vimrc/plug.vim

" COC
source $HOME/.vim/vimrc/coc.vim

" My config
source $HOME/.vim/vimrc/my_config.vim
