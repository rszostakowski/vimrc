"Remember to rename vimrc directory to .vim and create symbolic links
"sudo rm -r ~/.vimrc
"sudo ln -s ~/.vim/.vimrc ~/.vimrc
"A popular option to indicate switching to Insert mode (and back to Normal mode) is toggling the cursorline option that is responsible for whether the current screen line is highlighted.
autocmd InsertEnter,InsertLeave * set cul!

" Better command-line completion
set wildmenu
 
"Show numbers on each line
set number

"Highlight the word which we are searching
set hlsearch

"Highlight the words while typing
"Clears highlighted results after searching
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


" Use visual bell instead of beeping when doing something wrong
set visualbell

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Always display the status line, even if only one window is displayed
" set laststatus=2

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.

set autoindent
" add vertical and horizontal lines wher the cursor is
set cursorline      
set cursorcolumn

set incsearch
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
"It should make shift + o much faster
set timeout timeoutlen=5000 ttimeoutlen=100

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first
set hidden

" Show partial commands in the last line of the screen
set showcmd

" Switch beetwen tabs(buffers) in the same window
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprev<CR>

"Key mappings9
"ESC to jj
:imap jj <Esc>
"Deletes arrows in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"Disable CTRL Z - suspending vim 
noremap <c-z> <nop>
"Thanks to that if we have a really long line which breaks to two lines we can go to the upper visual line using gk or lower using gj
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^  
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" add newline without entering insert mode
nmap <A-o> o<Esc>k

"Nerdtree config
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Add a mapping to open the tree
map <C-e> :NERDTreeToggle<CR>

"THEME AND COLOR
"two lines below must be placed because Terminator program do not display the gruvbox theme https://stackoverflow.com/questions/38311626/vim-color-scheme-with-terminator#
set background=dark
set t_Co=256

" Copy to system cliboard - this one is disabled since plugin "System Copy"
set clipboard=unnamedplus

" Change color when in Insert mode
autocmd InsertEnter * set background=light
autocmd InsertLeave * set background=dark
"Adding colorscheme to vim 
"https://github.com/morhetz/gruvbox/wiki/Configuration
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

"To use this config in ideavim please add a line below to the ~/.ideavimrc source ~/.vim/vimrc
filetype on
"Syntax on must be the last one 
syntax on 
"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" adding buffers to F5
:nnoremap <F5> :buffers<CR>:buffer<Space>

" switch beeting windows for example ctrl + alt + leftarrow
nmap <silent> <C-A-Up> :wincmd k<CR>
nmap <silent> <C-A-Down> :wincmd j<CR>
nmap <silent> <C-A-Left> :wincmd h<CR>
nmap <silent> <C-A-Right> :wincmd l<CR>

" Clears the register
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" turn hybrid line numbers on vertical bar on left
:set number relativenumber
:set nu rnu

"##########################################VUNDLE#####################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' "plugin for dependency management

Plugin 'mileszs/ack.vim' "find word in package :ACK word_to_search - zastępuje GREPa
Plugin 'morhetz/gruvbox' "dark theme 
Plugin 'ap/vim-buftabline' "managing(switching) buffers -> CTRL <- or  CTRL ->
Plugin 'tpope/vim-surround' "for managing sourrinding tags 
Plugin 'kien/ctrlp.vim' " ctrl p  search for files
Plugin 'scrooloose/nerdtree' "search tree like in IDE
Plugin 'vim-airline/vim-airline' "pasek na dole
Plugin 'tomtom/tcomment_vim'    "do zakomentowywania kodu
Plugin 'tell-k/vim-autopep8'    "autopep8 - it is used to autoformat python code
Bundle 'Valloric/YouCompleteMe' 
Plugin 'Yggdroot/indentLine' "adds vertical lines in vim
Plugin 'vim-scripts/ReplaceWithRegister' "gr for replacing instead of viwp
Plugin 'christoomey/vim-titlecase' "gt makes a letter uppercase
Plugin 'tpope/vim-fugitive' "git support in vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"########YOUCOMPLETEME##############
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>
map <leader>gdc  :YcmCompleter GetDoc<CR>

"########PYTHON##############
" Runs python clear console and save the file
map <leader>r <Esc>:w<CR>:!clear<CR>:exec '!python' shellescape(@%, 1)<cr>
"python formating using autopep8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
let g:autopep8_diff_type='vertical' "makes autopep diff vertical
" Automatically fix PEP8 errors in the current buffer:
au FileType python setlocal formatprg=autopep8\ -


"########DISABLED##############
"Show in which mode we are 
" set showmode