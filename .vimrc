"Turn off Vi compatability
set nocompatible

set et ai "expand tabs and autoindent
set ts=4 sts=4 sw=4 "tabstop, softtabstop, and shiftwidth
set sta "smarttab
set colorcolumn=80
set number relativenumber "absolute line and relative jumps
set ruler

filetype plugin indent on
syntax on

"Filetype commands
autocmd FileType yaml setlocal ts=2 sw=2

let mapleader = " "

"Allow buffer switching w/o asking to save
set hidden

"remaps
nnoremap <C-d> <C-d>zz "center on half page move down
nnoremap <C-u> <C-u>zz "center on half page move up

nnoremap <Leader>fv :Explore<CR>
