" make vim incompatbile to vi
set nocompatible
set modelines=0

" TAB settings
set tabstop=2

" common settings
set number
set ruler
set cm=blowfish
set clipboard=unnamedplus

" tabs
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tt :tabedit<Space>
nnoremap td :tabclose<CR>
