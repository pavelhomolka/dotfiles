set nocompatible
set number
set ruler                                                           
set cm=blowfish
set tabstop=2
set clipboard=unnamedplus
set cursorline

" Build ctags
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Ctrl-Space for completions.
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Colorize cursor line
hi CursorLine ctermbg=Blue cterm=bold
