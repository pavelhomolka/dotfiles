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
set nowrap

" changing leader key
let mapleader = ","

" tabs
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tt :tabedit<Space>
nnoremap td :tabclose<CR>

" Vundle
"
" install all plugins: vim +PluginInstall +qall
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" YouCompleteMe
" http://valloric.github.io/YouCompleteMe
"
" install ycm_core
" 1] cd ~ && mkdir ycm_build && cd ycm_build
" 2] cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
" 3] cmake --build . --target ycm_core
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
let g:ycm_key_detailed_diagnostics  = '<F3>'
let g:ycm_confirm_extra_conf        = 0

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F2> :YcmDiags<CR>
nnoremap <C-j> :YcmCompleter GoToDeclaration<CR>
nnoremap <C-k> :YcmCompleter GoToDefinition <CR>
