syntax enable
colorscheme elflord
set number
set relativenumber
set mouse=a
set showcmd
set numberwidth=1
set ruler
set encoding=utf-8
set showmatch
set sw=2
set laststatus=2
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

call plug#begin('~/.vim/plugged;')

" Themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'


call plug#end()

let NERDTreeQuitOnOpen=1

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
