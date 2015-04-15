" Use sane Vim mode
set nocompatible


" Start Vundle {

    filetype off
    set runtimepath+=~/.vim/bundle/Vundle.vim/
    call vundle#rc()

    " Import all the bundles {
        Bundle 'gmarik/vundle'
        Bundle 'vim-multiple-cursors'
        Bundle 'pyflakes.vim'
        Bundle 'jellybeans.vim'
        Bundle 'The-NERD-tree'
        Bundle 'ctrlp.vim'
        Bundle 'nginx'
        Plugin 'rainbow_parentheses.vim'
        Plugin 'Tabular'
        Plugin 'junegunn/goyo.vim'
        Plugin 'junegunn/limelight.vim'
        Plugin 'wavded/vim-stylus'
        Plugin 'vim-javascript'
        Plugin 'mxw/vim-jsx'
        Plugin 'SuperTab'
        Plugin 'xmledit'
        Plugin 'surround.vim'
        Plugin 'rking/ag.vim'
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

let g:html_indent_inctags = "html,body,head,tbody,p"

" Reload a file if it has been changed quite useful when switching between
" branches with Git.
set autoread
set wildignore=*.o,*.obj,*.pyc
set noswapfile
set autochdir

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
"

" Remaps {
    " go to the next tab
    nnoremap <C-l> gt

    " go to the previous tab
    nnoremap <C-h> gT

    let mapleader = ","
" }

" ctags {
    set tags=./tags;$HOME
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
    au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
" }


set t_Co=256


" Plugin specific {

    " The-NERD-Tree {
        nnoremap <f2> :NERDTreeToggle<cr>
        let NERDTreeIgnore=['\.pyc$', '\~$']
    " }

    " rainbow_parenthesis {
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    " }

    " Limelight {
        let g:limelight_conceal_ctermfg = 'gray'
        let g:limelight_conceal_ctermfg = 240
    " }

    " JSX {
        let g:jsx_ext_required = 0
    " }

    " Goyo {
        let g:goyo_width = 120
    " }
" }

" Extensions {

    " Columnize {
        vnoremap <f3> :!column -t<cr>
    " }
" }

