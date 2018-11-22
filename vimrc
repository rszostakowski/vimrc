"Remember to rename vimrc directory to .vim

"Show in which mode we are 
set showmode
"Show numbers on each line
:set number
"Highlight the word which we are searching
:set hlsearch
"Highlight the words while typing
"Clears highlighted results after searching
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
:set incsearch
set list
set listchars=tab:>-
"Backspace can delete the line thanks to that
set backspace=indent,eol,start
"It should make shift + o much faster
:set timeout timeoutlen=5000 ttimeoutlen=100

set hidden
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprev<CR>

"Key mappings
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

"https://github.com/morhetz/gruvbox/wiki/Configuration
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

"To use this config in ideavim please add a line below to the ~/.ideavimrc source ~/.vim/vimrc
filetype on
"Syntax on must be the last one 
syntax on 


"##########################################VUNDLE#####################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'morhetz/gruvbox' 
Plugin 'ap/vim-buftabline'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tomtom/tcomment_vim'
"NET
Plugin 'OmniSharp/omnisharp-vim'

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
