" drop vi support, enables enhanced vim features
set nocompatible

" auto indent
set autoindent
" smartindent interferes with language based indentation

" show match brackets / braces
set showmatch

" show ruler in status bar
set ruler

" set terminal title to file name
set title

" show the command you are typing
set showcmd

" let the mouse work in terminals
set mouse=a

" line numbers
set relativenumber
set number

" always display the status bar
set laststatus=2

" search as you type
set incsearch

" let backspace delete auto indent, and line breaks
set backspace=indent,eol,start

" tab width
set tabstop=4
set shiftwidth=4
set expandtab

" allow unsaved buffers to be hidden
set hidden

" wildcard modes
set wildmode=longest:full,full
set wildmenu
set wildignore=*.o,*.obj,.git,.svn,*.pyc,*env/*

" scroll around the cursor
set scrolloff=3

" required for powerline unicode symbols
set encoding=utf-8

" use the system clipboard
set clipboard=unnamed

" use linebreak as word wrap mode
set linebreak

" enable syntax highlighting
syntax on


" Key Mappings
" ============

" use \ as leader, but map all our keys to , this is to stop plugins interfering with our keystrokes
let mapleader="\\"

" use ,, as a single ,
nnoremap ,, ,

" map jj to <esc> to keep fingers on home keys (insert mode only)
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>

" Vim housekeeping
nmap ,ve :e $MYVIMRC<cr>
nmap ,vs :so $MYVIMRC<cr>
nmap ,vh :so $VIMRUNTIME/syntax/hitest.vim<cr>

" Quickfix make
nmap ,q :wa\|silent!\|make!\|redraw!\|botright cwindow<cr>

" don't allow arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

