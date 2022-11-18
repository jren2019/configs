call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'klen/python-mode', {'branch': 'develop'}
Plug 'heavenshell/vim-pydocstring'
Plug 'yegappan/mru'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'
" Plug 'dense-analysis/ale'


" Show git changes
Plugin 'airblade/vim-gitgutter'
" Show buffers
Plugin 'fholgado/minibufexpl.vim'
" Flake8
Plugin 'nvie/vim-flake8'
" python autocomplete
Plugin 'davidhalter/jedi-vim'
" Dracula Theme
Plugin 'dracula/vim'
" File finder
Plugin 'kien/ctrlp.vim'
" Auto commenter
Plugin 'scrooloose/nerdcommenter'
" GPG encryption
Plugin 'jamessan/vim-gnupg'

call plug#end()

" let g:lightline = {
"   \ 'colorscheme': 'onedark',
"   \ }

" ctrl-p
" let g:ctrlp_working_path_mode = 'ra'
" nnoremap <silent> <Leader>f :CtrlPClearCache<CR>

" airline/powerline
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

" Pydocstring
let g:pydocstring_formatter = 'numpy'

if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

nnoremap <silent> <F8> :TagbarToggle<CR>
" let g:Tlist_Use_Right_Window = 1
nnoremap <F9> :NERDTreeToggle<CR>
nnoremap <C-T> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '^node_modules$']

" open NERDTree automatically
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" FZF
nnoremap <C-P> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Python-mode
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_virtualenv = 0
let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()'
" nmap <leader>b <ESC>Oimport ipdb; ipdb.set_trace()<ESC>:w<CR>

let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0
let g:pymode_options_max_line_length = 119
let g:pymode_run = 0
