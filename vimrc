"Remember to rename vimrc directory to .vim

"Show in which mode we are 
set showmode
"Show numbers on each line
:set number
"Highlight the word which we are searching
:set hlsearch
"Highlight the words while typing
:set incsearch
"Saves the go file automatically if you do :make
set autowrite
set list
set listchars=tab:>-

"Adding pathogen for libs management
execute pathogen#infect()

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

"Thanks to that if we have a really long line which breaks to two lines we can go to the upper visual line using gk or lower using gj
nnoremap j gj
nnoremap k gk

"Nerdtree config
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Add a mapping to open the tree
map <C-t> :NERDTreeToggle<CR>
"Vim-go mappings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
" Shortcut to Close quickfix window with leader+c
nnoremap <leader>a :cclose<CR>
" maps GoBuild to \b
autocmd FileType go nmap <leader>b  <Plug>(go-build)
" maps GoRun to \r
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" shows only the quickfix error list in vim-go
let g:go_list_type = "quickfix"
" timeout for tests run in vim-go
let g:go_test_timeout = '10s'
" go def vim-go problem when pressing ctrl t for NerdTree
let g:go_def_mapping_enabled=0

"THEME AND COLOR
"two lines below must be placed because Terminator program do not display the gruvbox theme https://stackoverflow.com/questions/38311626/vim-color-scheme-with-terminator#
set background=dark
set t_Co=256

"https://github.com/morhetz/gruvbox/wiki/Configuration
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

"To use this config in ideavim please add a line below to the ~/.ideavimrc source ~/.vim/vimrc
filetype on
" Enable filetype plugins - It is needed to run GoRun %
filetype plugin on
"Syntax on must be the last one 
syntax on 

