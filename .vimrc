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
Plug 'maralla/completor.vim'

call plug#end()

colorscheme gruvbox
set bg=dark
let NERDTreeQuitOnOpen=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
"let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> Tab_Or_Complete()

inoremap <expr> <up> pumvisible() ? '<c-y><up>' : '<up>'
inoremap <expr> <down> pumvisible() ? '<c-y><down>' : '<down>'

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>ln :lnext<CR>
nmap <Leader>lp :lprev<CR>
nmap <Leader>ec :SyntasticCheck<CR>
nmap <Leader>hl :wincmd J<CR>
nmap <Leader>vl :wincmd H<CR>
