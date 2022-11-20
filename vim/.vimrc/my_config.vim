" vue
au BufNewFile,BufRead *.vue,*.we,*njk setf html

nnoremap <leader>s :grep -r --exclude-dir=node_modules --include=\* * --exclude=tags --exclude=\*.bundle.js --exclude=\*.spec.js --exclude=\*.map<C-Left><C-Left><C-Left><C-Left><C-Left><Left>
nnoremap <leader>j :%!jq .<CR>:set ft=json<CR>
nnoremap <leader>h :%!jq -c .<CR>:set ft=<CR>
nnoremap <leader>fc :%!~/bin/fix_curl.bash<CR>
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
nnoremap <space> za
" vnoremap <space> zf

" Test and view result in new window
command Exec set splitright | vnew | set filetype=bash | read !bash #

" Others
set ts=4 sts=4 sw=4 expandtab hlsearch ic scs bkc=yes bo=all
au FileType html,xhtml,javascript,typescript,scss,css,vue,*we,*.njk,json,djson,jjson,yml,yaml set ts=2 sw=2 sts=2
au FileType roboto set set noet
au FileType python set foldmethod=indent

set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,ucs-bom,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set wig+=*.pyc,*.jpg,*.JPG,*.png,*.PNG,*.db,*.class,*bower_components/*,*node_modules/*
set wig+=staticfiles,dist,_indexdir
set wig+=*/platforms/*,*/plugins/*
set wig+=*/www/lib/*
" colo meta5
"
colo torte

hi VertSplit guifg=#444444 guibg=#585858 ctermfg=green ctermbg=black
hi Normal guibg=NONE ctermbg=NONE
hi CocFloating ctermbg=darkgrey


" ---

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set spell spelllang=en	" turn on spell check
set listchars=tab:→\ ,space:·	" set white space chars
set list		    " turn white space chars on
set ff=unix		    " use unix line separators
set ffs=unix		" more unix line separator stuff
set nu			    " line numbers
set updatetime=250	" update time
try
  colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
set guifont=Menlo\ Regular:h12	" set font
let g:miniBufExplForceSyntaxEnable = 1	" Stop syntax being turned off when a buffer is closed
set colorcolumn=120	" Set a 'ruler' at 120 chars
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Jedi settings
let g:jedi#popup_on_dot=0		    " don't auto pop up complete box
let g:jedi#show_call_signatures=0	" don't auto pop up call signatures

" Set TAB spacing
map <C-S-F9> :set autoindent<CR> :set noexpandtab<CR> :set softtabstop=0<CR> :set shiftwidth=4<CR> :set tabstop=4<CR>
map <C-F9> :set autoindent<CR> :set expandtab<CR> :set softtabstop=2<CR> :set shiftwidth=2<CR>
map <C-F10> :set autoindent<CR> :set expandtab<CR> :set softtabstop=4<CR> :set shiftwidth=4<CR>

" c tag stuff
map <C-F12> :!ctags -R --fields=+l --languages=python --python-kinds=-vi -f ./.tags `find ./ -name "*.py"`<CR>
map <C-F11> :!ctags -R --fields=+l --languages=python --python-kinds=-vi -f $VIRTUAL_ENV/tags $VIRTUAL_ENV/lib/python*/site-packages<CR>
set tags=.tags,$VIRTUAL_ENV/tags

" Toggle nerd tree with ctrl-n
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType gitcommit setlocal textwidth=0

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Run flake8 when writing a python buffer
  autocmd BufWritePost *.py call Flake8()

  " Format go files when writing
  autocmd BufWritePost *.go !gofmt -w %

  augroup END
else
  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
