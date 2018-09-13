"Enable tomorrow-night theme
"Based on the site http://marcgg.com/blog/2016/03/01/vimrc-example/
"Remember to rename vimrc directory to .vim

"Show in which mode we are
set showmode
"Show numbers on each line
:set number
"Highlight the word which we are searching
:set hlsearch
"Highlight the words while typing
:set incsearch

set list
set listchars=tab:>-

"To use this config in ideavim please add a line below to the ~/.ideavimrc source ~/.vim/vimrc
set background=dark
filetype on
syntax on
colorscheme Tomorrow-Night

"Adding pathogen for libs management
execute pathogen#infect()

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
