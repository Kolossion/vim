set termguicolors
set t_Co=256
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h10
set guioptions-=r
set guioptions-=L
filetype off                  " required
set laststatus=2
set hidden

call plug#begin('~/.vim/plugged')

Plug 'ElmCast/elm-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'daylerees/colour-schemes', { 'rtp': 'vim' }
Plug 'flazz/vim-colorschemes'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node', { 'for': ['javascript', 'coffee'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wavded/vim-stylus'
Plug 'wesQ3/vim-windowswap'
Plug 'morhetz/gruvbox'

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
colorscheme sourcerer
set omnifunc=syntaxcomplete
set number
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set incsearch
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

" Inc Search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

if exists(':terminal')
  nnoremap <leader>t :sp +terminal<cr>
endif

" Height of the command bar
set cmdheight=1
au BufRead,BufNewFile *.es6 setfiletype js

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_ignore_groups = ['Comment', 'String']


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

" Rust Racer
let g:racer_cmd = "/Users/thomascole/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
