"Enable tomorrow-night theme
"Based on the site http://marcgg.com/blog/2016/03/01/vimrc-example/
"Remember to rename vimrc directory to .vim
set background=dark
filetype on
syntax on
colorscheme Tomorrow-Night

"Key mappings
"ESC to jj
:imap jj <Esc>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"Thanks to that if we have a really long line which breaks to two lines we can go to the upper visual line using gk or lower using gj
nnoremap j gj
nnoremap k gk
