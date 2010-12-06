set nocompatible

set autoindent
set background=light
set backspace=indent,eol,start
set autoindent
set expandtab
set hidden
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:>
set noerrorbells
set nobackup
set nohlsearch
set noswapfile
set nowrapscan
set ruler
set rulerformat=%40(%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P%)
set shiftround
set shiftwidth=4
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set virtualedit=all
set visualbell
set writeany

" Shortcut to use command mode without shift
nnoremap ; :

" Reformat the current paragraph or selection
vmap Q gq
nmap Q gqap

" Jump cursor to the next editor row instead of over line wraps
nnoremap j gj
nnoremap k gk

" Shortcuts to change windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Have \tp ("toggle paste") toggle paste on/off and report the change, and
" where possible also have <F4> do this both in normal and insert mode:
nnoremap \tp :set invpaste paste?<CR>
nmap <F4> \tp
imap <F4> <C-O>\tp
set pastetoggle=<F4>

" Have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
    syntax on
endif

" Prefer utf8 encoding
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=utf-8,latin1
endif

if has("autocmd")
    " Filetype specific formatting
    filetype on
    filetype indent on
    filetype plugin on

    " Start syntax parse from the beginning of a file
    autocmd BufEnter * :syntax sync fromstart

    " Jump to the last known position in a file
    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$")
    \ |     exe "normal! g'\""
    \ | endif

    " Makefiles want tabs
    autocmd BufNewFile,BufRead Makefile* set noexpandtab

    " Color tabs and trailing whitespace gray
    autocmd BufRead,BufNewFile * match GrayArea /\(\t\|\s\+$\|\%>79v.\+\)/
    highlight GrayArea ctermbg=lightgray guibg=lightgray
endif

