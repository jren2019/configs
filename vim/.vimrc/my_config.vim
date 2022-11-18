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
