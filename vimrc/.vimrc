set termguicolors
set t_Co=256
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set guioptions-=r
set guioptions-=L
set laststatus=2
set signcolumn=yes
set hidden
set autoread
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'ElmCast/elm-vim'
Plug 'jparise/vim-graphql'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'daylerees/colour-schemes', { 'rtp': 'vim' }
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes', {'set': 'all'}
Plug 'haya14busa/incsearch.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node', { 'for': ['javascript', 'coffee'] }
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
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
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()            " required

filetype plugin indent on    " required

syntax on
set background=dark
let g:neosolarized_contrast="high"
colorscheme gruvbox
set omnifunc=syntaxcomplete
set number
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set incsearch
set cc=80
set cursorline
set ai
set si
set wrap
set splitright
set splitbelow

" Set leader
let mapleader = ","
let g:mapleader = ","

set rtp+=/.fzf
nmap <leader><tab> <plug>(fzf-maps-n)
noremap <C-p> :Files<cr>
"--column: Show column number
"--line-number: show line number
"--no-heading: Do not show file headings in results
"--fixed-strings: Search term as a literal string
"--ignore-case: Case insensitive search
"--no-ignore: Do not respect .gitignore, etc...
"--follow: follow symlinks
"--glob Additional conditions for search (in this case ignore
"    everything in the `.git/` folder.
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
                                                                                   
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',                                                         
  \ 'ctrl-x': 'split',                                                             
  \ 'ctrl-v': 'vsplit' }

let g:deoplete#enable_at_startup=1

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" set cool keycombos
nmap <leader>w :w!<cr>

nmap <space> <Plug>(easymotion-s)
vmap <space> <Plug>(easymotion-s)

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
let g:elm_format_autosave = 1

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
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

