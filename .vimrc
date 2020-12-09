" Tell vim to use sh instead of fish to avoid errors
set shell=/bin/sh

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Run git commands from vim
Plugin 'tpope/vim-fugitive'
" Colorschemes!
Plugin 'flazz/vim-colorschemes'
" Python PEP-8 and pyflakes
Plugin 'nvie/vim-flake8'
" status bar
Plugin 'vim-airline/vim-airline'
" Show line status on git-tracked files
Plugin 'airblade/vim-gitgutter'
" Fancy autocompletion
Plugin 'davidhalter/jedi-vim'
" Auto-show autocompletion
Plugin 'vim-scripts/AutoComplPop'
" Smart Python indenting
Plugin 'hynek/vim-python-pep8-indent'
" Navigate across vim/tmux
Plugin 'christoomey/vim-tmux-navigator'
" Python code auto-folding
Plugin 'tmhedberg/SimpylFold'

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme badwolf          " awesome colorscheme
syntax enable                " enable syntax processing

" Tabs-to-spaces incantations
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
filetype indent on      " load filetype-specific indent files

set number              " show line numbers
highlight LineNr ctermfg=white ctermbg=17
set cursorline     " Highlight the current line
set showmatch           " highlight matching [{()}]

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set foldenable          " enable folding

" Persistent undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Run flake8 plugin on write-out
autocmd BufWritePost *.py call Flake8()

" Use powerline fonts in airline
let g:airline_powerline_fonts = 1
" Loads airline without requiring a split
set laststatus=2

" Allow backspace to traverse autoindent, lines, i start
set backspace=indent,eol,start

" Show autocompletions quickly
let g:jedi#show_call_signatures_delay = 10

" Show a line guide for 80 characters
set colorcolumn=80
