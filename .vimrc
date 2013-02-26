"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
"--------------------------------------------------------------------
" Vundle setup
"--------------------------------------------------------------------
filetype off            "  required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle : required
Bundle 'gmarik/vundle'

" Language specific syntax files
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'dougireton/vim-ps1'

" comment plugin
Bundle 'tpope/vim-commentary'

" Syntax check on buffer save
Bundle 'scrooloose/syntastic'
"let g:syntastic_check_on_open=1
"
" Git plugins
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

" Various editing plugins
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'

" File managers and explorers
Bundle 'kien/ctrlp.vim'           
Bundle 'mileszs/ack.vim'          
Bundle 'scrooloose/nerdtree'     
Bundle 'scrooloose/nerdcommenter' 

" Colorschemes
"colorscheme crt
if has('gui_running')
  set background=light
else
  set t_Co=16
  set background=dark
endif
Bundle 'altercation/vim-colors-solarized'

if has('autocmd')
  filetype plugin indent on
endif

" turn on syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" run the builtin matchit plugin
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" load the main plugin for a nice man viewer
runtime! ftplugon/man.vim

" --------------------------------------------------------------
"  Moving around, searching and patterns
"  -------------------------------------------------------------
set nostartofline       " keep cursor in same column for 
                      "  long-range motion cmds
set incsearch           " highlight pattern matches as you type
set ignorecase          " ignore case when using a search pattern
set smartcase         " override ignorecase with pattern has
                      " uppercase character

"---------------------------------------------------------------
" Tags
"--------------------------------------------------------------

"--------------------------------------------------------------
" Displaying text
"-------------------------------------------------------------
set scrolloff=5
set linebreak
"set showbreak=
set sidescrolloff=2              " min number of columns to 
set display+=lastline
set cmdheight=2

"------------------------------------------------------------
" syntax, highlighting and spelling
"------------------------------------------------------------
" colorscheme solarized
" set background=dark
" set colorcolumn=80

"-----------------------------------------------------------
" multiple windows
"----------------------------------------------------------
set laststatus=2
set hidden
set switchbuf=usetab

set statusline=
set statusline+=b%-1.3n\ >
set statusline+=\ %{fugitive#statusline()};
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%R
set statusline+=%#Warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ <\ %{&fenc}
set statusline+=\ <\ %{&ff}
set statusline+=\ <\ %p%%
set statusline+=\ %l:
set statusline+=%02.3c

set helpheight=30

"
" multiple tab pages
"

"
" terminal
"
set ttyfast
" 256 gives glare on backgroun, 258 gives black background - easier of eyes
"set t_Co=257
"
" using the mouse
"
set mouse=a

"---------------------------------------------------------------------
" GUI
"---------------------------------------------------------------------

"
"---------------------------------------------------------------------
" printing
"---------------------------------------------------------------------
"

"
"---------------------------------------------------------------------
" messages and info
"---------------------------------------------------------------------
"
set showcmd
set ruler
set confirm

"-------------------------------------------------------------------------
" selecting text
"------------------------------------------------------------------------
set clipboard=unnamed " yank to system clipboard by default

"-------------------------------------------------------------------------
" editing  text
"-------------------------------------------------------------------------
" set backspace=indent,eol,start
"
" delete comment char on second line when joining 2 commented lines
"if v:version > 7.03 || v:version == 7.03 && has("patch541")
 " set formatoptions+=j
"endif

set showmatch
set nojoinspaces
set completeopt+=longest
set nrformats-=octal  " don't treat numbers with leading 0 as octal

"
" tabs and indenting
"
set smarttab
set shiftround
set autoindent
set smartindent
set showmatch
set nostartofline

"
" folding
"
set nofoldenable " when opening files, all folds open by default

"
" diff mode
"

"
" mapping
"
map <C-n> :NERDTreeToggle<CR>

"
" reading and writing files
"
set autoread        " automatically re-read files changed outside of vim

"
" the swap file
"
if has("win32") || has("win64")
  set directory=$TEMP
else
  set directory=~/tmp,.,/var/tmp,/tmp
endif

"-----------------------------------------------------------------------
" command line editing
"-----------------------------------------------------------------------
set history=200          " save more commands in history
set wildmode=list:longest,full
set wildignore+=*.exe,*.swp,.DS_Store
set wildmenu

" add guard around 'wildignorecase to prevent terminal vim error
if exists('&wildignorecase')
  set wildignorecase
endif

"--------------------------------------------------------------------------
" executing external commands
"--------------------------------------------------------------------------
" Enhanced keyboard mappings 
" from http://gergap.wordpress.com/2009/05/29/minimal-vimrc-for-cc-developers/
" 
nmap <F2> :w<CR>
" in insert mode, F2 with exit insert, save, and enter insert again
imap <F2> <ESC>:w<CR>i
" 
"--------------------------------------------------------------------------
" running make and jumping to errors
"--------------------------------------------------------------------------
" build using make with <F7>
map <F7> :make
" build all from start
map <S-F7> :make clean all


"--------------------------------------------------------------------------
" language specific
"--------------------------------------------------------------------------

"
"--------------------------------------------------------------------------
" multi-byte characters
"--------------------------------------------------------------------------
"
set encoding=utf-8

"
"--------------------------------------------------------------------------
" various
"--------------------------------------------------------------------------
"
set gdefault

"
"--------------------------------------------------------------------------
" autocmds
"--------------------------------------------------------------------------
"

" in text files, limite width to 78 characters
autocmd BufRead *.txt set tw=78
"---------------------
" Can't live without these
set nocompatible
set viminfo=
" ------------------------------------------------------------------------
"  screen
"
" tried lots of different colour schemes and like this one the best.
" leave 5 lines before scrolling
set scrolloff=5
"
"--------------------------------------------------------------------------
"
" automatically detect filetypes
filetype indent plugin on
" 
set fileformats=unix,dos,mac
syntax on
set hidden
"
" stuff for c programming
set comments=sl:/*,mb:\ *,elx:\ */
set textwidth=120
 
"------
" Usability Options
" write swap file to disk after every 50 characters
set updatecount=50
"
set confirm
set visualbell
set t_vb=
set number
set shiftwidth=2
set softtabstop=2
set expandtab


"--------------------------------------------------------------------------
" Allow for overriding these settings
"--------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
