" Turn off vi compatibility
set nocompatible 

" Turn on syntax highlighting
syntax on 

" To load plugins correctly
filetype plugin indent on

" Map leader key to Space
let mapleader = "\<Space>" 

" Show line #s
"set number
set relativenumber  " relative line numbers

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

" Shortcut to save file
nnoremap <leader>w :w<CR>

" Status Line

let g:currentmode={
	\ 'n'  : 'Normal ',
	\ 'no' : 'Normal - Operator Pending ',
	\ 'v'  : 'Visual ',
	\ 'V'  : 'Visual - Line ',
	\ '^V' : 'Visual - Block ',
	\ 's'  : 'Select ',
	\ 'S'  : 'Select - Line ',
	\ '^S' : 'Select - Block ', 
	\ 'i'  : 'Insert ',
	\ 'R'  : 'Replace ',
	\ 'Rv' : 'Visual - Replace ',
	\ 'c'  : 'Command ',
	\ 'cv' : 'Vim Ex ',
	\ 'ce' : 'Ex ',
	\ 'r'  : 'Prompt ',
	\ 'rm' : 'More  ',
	\ 'r?' : 'Confirm ',
	\ '!'  : 'Shell ',
	\ 't'  : 'Terminal '
	\}

" Change statusline color depending on mode
function! ChangeStatusLineColor()
	if (mode() ==# 'n')
		exe 'hi! StatusLine ctermfg=004'
	elseif (mode() ==# 'i')
		exe 'hi! StatusLine ctermfg=005'
	elseif (mode() ==# 'v')
		exe 'hi! StatusLine ctermfg=002'
	else
		exe 'hi! StatusLine ctermfg=007'
	endif

	return ''
endfunction

function! GitInfo()
	let git = fugitive#head()
	if git != ''
		return ' '.fugitive#head()
	else
		return ''
endfunction

set statusline=
set statusline+=%{ChangeStatusLineColor()}			" Change statusline color 
set statusline+=%0*\ %{g:currentmode[mode()]}		" Current mode
set statusline+=%4*\ %{GitInfo()}					" Git branch
set statusline+=%1*\ %F								" Full file path 
set statusline+=%3*\ %m								" Modified flag
set statusline+=%=									" Right align
set statusline+=%1*\ %y\ 							" File type 
set statusline+=%0*\ \ %l							" Line number
set statusline+=/%L\ 								" Total number of lines

hi User1 ctermfg=007
hi User2 ctermfg=004
hi User3 ctermfg=005
hi User4 ctermfg=002
hi User5 ctermfg=007
hi User6 ctermfg=007
hi User7 ctermfg=007
hi User8 ctermfg=007
hi User9 ctermfg=007

" Use pathogen to bundle plugins in ~/.vim/bundle
call pathogen#infect()
call pathogen#helptags()  

" Color scheme
"colorscheme monokai

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
