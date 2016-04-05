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

NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'Lokaltog/vim-easymotion'

NeoBundle 'mhinz/vim-signify'

NeoBundle 'mhinz/vim-startify'

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

NeoBundle 'tpope/vim-sleuth'

NeoBundle 'tpope/vim-surround'

NeoBundle 'tsukkee/unite-tag'

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

" allow unsaved buffers to be hidden
set hidden

" wildcard modes
set wildmode=longest:full,full
set wildmenu
set wildignore=*.o,*.obj,.git,.svn,*.pyc,*env/*

" scroll around the cursor
set scrolloff=3

" visually indicate insert mode with cursorline
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" required for powerline unicode symbols
set encoding=utf-8

" use the system clipboard
set clipboard=unnamed

" use linebreak as word wrap mode
set linebreak

" disable folding
set foldlevelstart=99

" enable syntax highlighting
syntax on

" GUI / Terminal Options
" ======================
if has("gui_running")
    " hide any gui toolbars
    set guioptions-=T
    " hide scroll bars
    set guioptions-=l
    set guioptions-=r
    set guioptions-=R
    set guioptions-=L
    set guifont=Menlo:h14

    set background=light
    colorscheme base16-custom
else
    set background=dark
    colorscheme base16-custom
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

" Bufferline
" ----------
let g:bufferline_show_bufnr = 0

" Signify
" -------
let g:signify_vcs_list = [ 'git' ]

" Startify
" --------
let g:startify_custom_header = map(split(system('fortune -s -n 300 | cowsay'), '\n'), '"   ". v:val') + ['','']
let g:startify_custom_footer = [
    \ '',
    \ '   <Space>b   unite buffer',
    \ '   <Space>f   unite files',
    \ '   <Space>y   unite yankring',
    \ '',
    \ '   <Space>cm  make',
    \ '   <Space>cc  close quickfix',
    \ '   <Space>cf  vimfiler',
    \ ]

" EasyMotion
" ----------
" disable default mappings
let g:EasyMotion_do_mapping = 0
" don't move to start of line with j & k
let g:EasyMotion_startofline = 0

" mappings
map <Space><Space> <Plug>(easymotion-s)

" colours
hi link EasyMotionTarget Constant
hi link EasyMotionShade Comment
hi link EasyMotionTarget2First Constant
hi link EasyMotionTarget2Second PreProc

" Markdown
" --------
let g:vim_markdown_folding_disabled=1

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
call unite#custom#profile('files', 'context.ignorecase', 1)
let g:unite_source_rec_async_command =
                \ 'ag --follow --nocolor --nogroup -g ""'
nnoremap <Space>f :<C-u>Unite -buffer-name=files -profile-name=files -start-insert
            \ file_rec/async:!<cr>

" buffer related
nnoremap <Space>b :<C-u>Unite -quick-match buffer<cr>

" other
let g:unite_source_history_yank_enable = 1
nnoremap <Space>y :<C-u>Unite history/yank<cr>

" VimFiler
" --------
autocmd FileType vimfiler setlocal nonumber
autocmd FileType vimfiler setlocal norelativenumber

" Key Mappings
" ============

" use \ as leader, but map all our keys to , this is to stop plugins interfering with our keystrokes
let mapleader="\\"

" disable Q -> ex mode
nnoremap Q <nop>

" map kj to <esc> to keep fingers on home keys (insert mode only)
inoremap kj <esc>

" Vim housekeeping
nmap <Space>ve :e $MYVIMRC<cr>
nmap <Space>vs :so $MYVIMRC<cr>
nmap <Space>vh :so $VIMRUNTIME/syntax/hitest.vim<cr>
nmap <silent> ,vg
 \ :echo "hi<".synIDattr(synID(line("."),col("."),1),"name").'>'
 \ . ' trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
 \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
 \ <CR>:execute "highlight " .
 \ synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>

" Compile commands
nmap <Space>cm :Make<cr>
nmap <Space>cc :cclose<cr>
nmap <Space>cf :<C-u>VimFilerExplorer -toggle -winwidth=30<CR>

" don't allow arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

