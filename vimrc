" using https://github.com/Shougo/neobundle.vim
" to install enter the following on the command line
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

if has('vim_starting')
    " drop vi support, enables enhanced vim features
    set nocompatible

    " add neobundle to run time path
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" start neobundle
call neobundle#begin(expand('~/.vim/bundle/'))

" let neobundle mange itself
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
" =======

NeoBundle 'ap/vim-css-color'

NeoBundle 'bling/vim-airline'

NeoBundle 'bling/vim-bufferline'

NeoBundle 'dag/vim2hs'

NeoBundle 'eagletmt/ghcmod-vim'

NeoBundle 'eagletmt/neco-ghc'

NeoBundle 'Lokaltog/vim-easymotion'

NeoBundle 'mhinz/vim-signify'

NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'Shougo/vimfiler.vim'

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    }
    \ }

NeoBundle 'Shougo/unite.vim'

NeoBundle 'plasticboy/vim-markdown'

NeoBundle 'tpope/vim-dispatch'

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'tpope/vim-repeat'

NeoBundle 'tpope/vim-surround'

NeoBundle 'tsukkee/unite-tag'

NeoBundle 'wting/rust.vim'

" load plugins
call neobundle#end()

" required by neobundle
filetype plugin indent on

NeoBundleCheck

" VIM Settings
" ============

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

" colour scheme
set background=dark
colorscheme base16-custom

" enable syntax highlighting
syntax on

" GUI Options
" ===========
if has("gui_running")
    " hide any gui toolbars
    set guioptions-=T
    " hide scroll bars
    set guioptions-=l
    set guioptions-=r
    set guioptions-=R
    set guioptions-=L
    set guifont=Menlo:h14
endif

" Terminal Options
" ================
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" enable terminal italics
let &t_ZH = "\<Esc>[3m"
let &t_ZR = "\<Esc>[23m"

" Plugins
" =======

" Airline
" -------
let g:airline_left_sep=''
let g:airline_right_sep=''

" Signify
" -------
let g:signify_vcs_list = [ 'git' ]


" EasyMotion
" ----------
" disable default mappings
let g:EasyMotion_do_mapping = 0
" don't move to start of line with j & k
let g:EasyMotion_startofline = 0

" mappings
map <Space>s <Plug>(easymotion-s)
map <Space>w <Plug>(easymotion-bd-w)
map <Space>t <Plug>(easymotion-bd-t)
map <Space>h <Plug>(easymotion-linebackward)
map <Space>l <Plug>(easymotion-lineforward)

map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
map <Leader>J <Plug>(easymotion-sol-j)
map <Leader>K <Plug>(easymotion-sol-k)

" colours
hi link EasyMotionTarget Constant
hi link EasyMotionShade Comment
hi link EasyMotionTarget2First Constant
hi link EasyMotionTarget2Second PreProc

" Neco-GHC
let g:necoghc_enable_detailed_browse = 1

" Neocomplete
" -----------
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Unite
" -----
let g:unite_split_rule = 'botright'

" file related
call unite#custom#profile('files', 'ignorecase', 1)
let g:unite_source_rec_async_command =
                \ 'ag --follow --nocolor --nogroup -g ""'
nnoremap ,f :<C-u>Unite -buffer-name=files -profile-name=files -start-insert
            \ file_rec/async:!<cr>

" buffer related
nnoremap ,b :<C-u>Unite -quick-match buffer<cr>

" other
let g:unite_source_history_yank_enable = 1
nnoremap ,y :<C-u>Unite history/yank<cr>

" VimFiler
autocmd FileType vimfiler setlocal nonumber
autocmd FileType vimfiler setlocal norelativenumber

" Vim2HS / Haskell
" ----------------
autocmd Syntax haskell setlocal foldlevel=2
autocmd Syntax haskell setlocal foldcolumn=1
autocmd FileType haskell compiler cabal
autocmd FileType haskell setlocal makeprg=cabal\ build\ -v0
autocmd BufWritePost *.hs GhcModCheckAsync

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
nmap <silent> ,vg
 \ :echo "hi<".synIDattr(synID(line("."),col("."),1),"name").'>'
 \ . ' trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
 \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
 \ <CR>:execute "highlight " .
 \ synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>

" Compile commands
nmap ,cm :Make<cr>
nmap ,cc :cclose<cr>
nmap ,cf :<C-u>VimFilerExplorer -toggle -winwidth=30<CR>

" don't allow arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

