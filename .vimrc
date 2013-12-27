" Persa's vimrc file.
" Borrowed from various sources

"BASICS

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set number		" allow line numbers on code
set numberwidth=3	" give the numbers some gutter


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif
"  You can add all your preferred settings to this "vimrc" file.
"  For more information type  :help vimrc-intro

set nocompatible              " be iMproved
filetype off                  " required!


"VUNDLE SETUP
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
" original repos on GitHub

Bundle 'tpope/vim-rails.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'Lokaltog/powerline.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-rake.git'
Bundle 'tpope/vim-haml.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'bling/vim-airline.git'
Bundle 'edkolev/tmuxline.vim.git'
Bundle 'othree/html5.vim.git'
Bundle 'pangloss/vim-javascript.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'jezcope/vim-align.git'
Bundle 'vim-scripts/scratch.vim.git'
Bundle 'scrooloose/nerdcommenter.git'


filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" Set leader key
" to comma
:let mapleader=","

" Set up Airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:tmuxline_preset = {
      \'a'       : '#S',
      \'y'       : [ '%Y-%m-%d', '%H:%M' ],
      \'z'       : [ '#h', '#(cat ~/.thyme-tmux)' ],
      \'win'     : [ '#I', '#W' ],
      \'cwin'    : [ '#I', '#W' ],
      \'options' : { 'status-justify': 'left'} }

"set pastemode from clipboard with proper indentation
set pastetoggle=<leader>i

"For ERB  & HTML Formatting
autocmd BufRead,BufNewFile *.erb  set filetype=html autoread
autocmd BufRead,BufNewFile *.html set filetype=html autoread

"For Markdown Formatting
au BufRead,BufNewFile *.markdown,*.mdown,*.mkd,*.mkdn,README.md setf markdown

" Trailing Whitespace
match ErrorMsg '\s\+$'

" KILL ALL WHITESPACE!
nnoremap <leader>rtw :%s/\s\+$//e<CR>

"Remove trailing whitespace (per mattr_'s vimrc)
nnoremap <silent> ,sw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"Backup stuff
set nobackup
set nowritebackup

"no swap
set noswapfile

" Toggle paste
" For some reason pastetoggle doesn't redraw the screen (thus the status bar
" doesn't change) while :set paste! does, so I use that instead.
" set pastetoggle=<F6>
nnoremap <F6> :set paste!<cr>
nnoremap <F7> :noh<cr>

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Resize splits when the window is resized
au VimResized * :wincmd =

"jj escape
:imap jj <Esc>

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show command in bottom right portion of the screen
set showcmd

"Indent stuff
set smartindent
set autoindent

"Set incremental searching
set incsearch

"Highlight searching
set hlsearch

"case insensitive search
set ignorecase
set smartcase

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"make myself use hjkl instead of arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

"NERDTreeToggle
map <leader>kb :NERDTreeToggle<CR>

"Map CTags for CTRL P usage
nnoremap <leader>. :CtrlPTag<cr>

"Integration with Thyme
nmap <leader>t :!thyme -d<cr>
nmap <leader>ts :!thyme -s<cr>
