" Use sane Vim mode
set nocompatible


" Start Vundle {

    filetype off
    set runtimepath+=~/.vim/bundle/vundle/
    call vundle#rc()

    " Import all the bundles {
        Bundle 'gmarik/vundle'
        Bundle 'vim-multiple-cursors'
        Bundle 'pyflakes.vim'
        Bundle 'jellybeans.vim'
        Bundle 'The-NERD-tree'
        Bundle 'ctrlp.vim'
    " }


    filetype plugin indent on
" }


" Thanks xterm for remapping my F keys {
    if &term =~ "xterm" || &term =~ "screen"
        map <Esc>OP <F1>
        map <Esc>OQ <F2>
        map <Esc>OR <F3>
        map <Esc>OS <F4>
        map <Esc>[16~ <F5>
        map <Esc>[17~ <F6>
        map <Esc>[18~ <F7>
        map <Esc>[19~ <F8>
        map <Esc>[20~ <F9>
        map <Esc>[21~ <F10>
        map <Esc>[23~ <F11>
        map <Esc>[24~ <F12>
    endif
" }


" Reload a file if it has been changed quite useful when switching between
" branches with Git.
set autoread
set wildignore=*.o,*.obj,*.pyc
set noswapfile

" Please the eyes {
    colorscheme jellybeans
" }


" Formatting {
    set nowrap
    set autoindent
    set expandtab
    set shiftwidth=4
    set softtabstop=4

    set number
" }

" Remaps {
    " go to the next tab
    nnoremap <C-l> gt

    " go to the previous tab
    nnoremap <C-h> gT

    let mapleader = ","
" }

" Some useful func {
    function! Preserve(command)
        " preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        execute a:command
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction

    function! StripTrailingWhitespace()
        call Preserve("%s/\\s\\+$//e")
    endfunction
" }

" Autocommands {
    autocmd BufWritePre <buffer> call StripTrailingWhitespace()
" }


" Plugin specific {

    " The-NERD-Tree {
        nnoremap <f2> :NERDTreeToggle<cr>
        let NERDTreeIgnore=['\.pyc$', '\~$']
    " }

" }
