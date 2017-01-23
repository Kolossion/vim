set termguicolors
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
filetype off                  " required
set laststatus=2

call plug#begin('~/.vim/plugged')

Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'moll/vim-node', { 'for': ['javascript', 'coffee'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --racer-completer' }
Plug 'ElmCast/elm-vim'
Plug 'scrooloose/syntastic'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline-themes'
Plug 'wesQ3/vim-windowswap'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-repeat'
Plug 'wavded/vim-stylus'
Plug 'ap/vim-css-color'
Plug 'rizzatti/dash.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-abolish'

call plug#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lin

syntax on
colorscheme distinguished
set omnifunc=syntaxcomplete
set number
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set cc=80
set cursorline
set autoread
set ai
set si
set wrap
set splitright
set splitbelow


" cursor tmux stuff
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" inoremap <special> <Esc> <Esc>hl
" set guicursor+=i:blinkwait0

" Set leader
let mapleader = ","
let g:mapleader = ","

" set cool keycombos
nmap <leader>w :w!<cr>
map <space> /
map <c-space> ?

" Height of the command bar
set cmdheight=1
au BufRead,BufNewFile *.es6 setfiletype js

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" elm
let g:elm_syntastic_show_warnings = 1
let g:elm_setup_keybindings = 1
" let g:elm_format_autosave = 1

" java/coffee-script
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers=['coffeelint', 'coffee']
let g:used_javascript_libs='ramda,react'

" rust
let g:rust_recommended_style = 0

let g:ycm_semantic_triggers = {
  \ 'elm' : ['.'],
  \ }

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tabularize
nmap ,a= :Tabularize /=<CR>
vmap ,a= :Tabularize /=<CR>
nmap ,a: :Tabularize /:<CR>
vmap ,a: :Tabularize /:<CR>
nmap ,aa :Tabularize /\CAS<CR>

let g:gitgutter_sign_column_always=1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " use AG in Ack
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.swp$']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>

" airline stuff
let g:airline_powerline_fonts = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
