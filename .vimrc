syntax enable
set number
set relativenumber
set mouse=a
set showcmd
set numberwidth=1
set ruler
set encoding=utf-8
set showmatch
set sw=4
set laststatus=2
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

call plug#begin('~/.vim/plugged;')

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'micha/vim-colors-solarized'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'

call plug#end()

colorscheme gruvbox
set bg=dark
let NERDTreeQuitOnOpen=1

let g:syntastic_always_populate_loc_list = 1

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>ln :lnext<CR>
nmap <Leader>lp :lprev<CR>
