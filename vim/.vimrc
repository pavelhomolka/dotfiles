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

" changing leader key
let mapleader = ","

" tabs
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tt :tabedit<Space>
nnoremap td :tabclose<CR>

" cscope and ctags
function! LoadCScopeDatabases()
    let databaseDir = $HOME . "/.vim/cscope_databases"

		if IsFileAlreadyExists (databaseDir . "/last_project_cscope")
        execute ":silent cs add " . databaseDir . "/last_project_cscope"
    endif

		if IsFileAlreadyExists (databaseDir . "/usr_include_cscope")
        execute ":silent cs add " . databaseDir . "/usr_include_cscope"
    endif

    echohl StatusLine | echo "CScope databases loaded successfully..." | echohl None
endfunction

function! UpdateCscopeDatabase(basedir)
    let databaseDir = $HOME . "/.vim/cscope_databases"
    let findCommand = "find $(pwd) -type f -name '*.c' -o -name '*.h' -o -name '*.java' -o -name '*.py' -o -name '*.hpp' -o -name '*.hh' -o -name '*.cpp' -o -name '*.cc' > /tmp/cscope.files"

    execute ":silent !cd " . a:basedir . " && " . findCommand . " && cd /tmp && cscope -b && cp cscope.out " . databaseDir . "/last_project_cscope && rm cscope.files cscope.out"
    execute ":silent cs reset"

    call UpdateTags(a:basedir)
    execute ":redraw!"
endfunction

function! UpdateTags(basedir)
    execute ":silent !cd " . a:basedir . " && ctags -R --sort=yes --fields=+iaSnkt --extra=+q+f --exclude=build -f ~/.vim/tags/last_project_tags $(pwd)"
    execute ":redraw!"
endfunction

function! UpdateAllCscopeDatabases()
    let databaseDir = $HOME . "/.vim/cscope_databases"
    let tagsDir = $HOME . "/.vim/tags"

    call UpdateCscopeDatabase("/usr/include")
    execute ":silent !cp " . databaseDir . "/last_project_cscope " . databaseDir . "/usr_include_cscope"
    execute ":silent !cp " . tagsDir . "/last_project_tags " . tagsDir . "/usr_include_tags"

    call UpdateCscopeDatabase(".")
    execute ":redraw!"
endfunction

function! IsFileAlreadyExists(filename)
   if filereadable(a:filename)
        return 1
    else
        return 0
    endif
endfunction

set tags+=~/.vim/tags/usr_include_tags
set tags+=~/.vim/tags/last_project_tags

nmap <leader>ud :silent call UpdateCscopeDatabase(".")<cr>:w<cr>
nmap <leader>uad :call UpdateAllCscopeDatabases()<cr>:w<cr>

" startup command
autocmd VimEnter * call LoadCScopeDatabases()

" clang complete
" https://github.com/Rip-Rip/clang_complete
let g:clang_library_path="/usr/lib/libclang.so"
