" Turn off vi compatibility
set nocompatible 

" Turn on syntax highlighting
syntax on 

" To load plugins correctly
filetype plugin indent on

" Map leader key to Space
let mapleader = "\<Space>" 

" Show line #s
set number

" Show file stats
set ruler

" Blink cursor on error
set visualbell

" Whitespace
set wrap
set tabstop=4
set autoindent
set copyindent
set shiftwidth=4
set smarttab
" Toggle whitespace visualization
map <leader>l :set list!<CR>

" Cursor motion
set backspace=indent,eol,start

inoremap jk <Esc>
nnoremap ; :

" Line navigation
nnoremap j gj
nnoremap k gk

" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Allow hidden buffers
set hidden

" Faster rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set smartcase
set showmatch
" Clear search buffer
nmap <silent> <leader>/ :nohlsearch<CR>

" Shortcuts to edit/reload vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Shortcut to save file
nnoremap <leader>w :w<CR>

" Use pathogen to bundle plugins in ~/.vim/bundle
call pathogen#infect()
call pathogen#helptags()  

" Color scheme
colorscheme monokai

" Color scheme: solarized, *change iTerm colors to Solarized Dark
"set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized

" Color scheme: hybrid, *change iTerm colors to hybrid
"set background=dark
"let g:hybrid_custom_term_colors = 1
"colorscheme hybrid

" NERD Tree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>n :NERDTreeToggle<CR>

" Airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16_monokai'
