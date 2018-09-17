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
map <C-e> :NERDTreeToggle<CR>

"GOLANG SHORTCUTS
"Vim-go mappings for traversing errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
" Shortcut to Close quickfix window with leader+c
nnoremap <leader>a :cclose<CR>
" maps GoBuild to \b  run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" maps GoRun to \r
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-imports)
" quick for seeing the function signature
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>d <Plug>(go-decls)
autocmd FileType go nmap <Leader>f <Plug>(go-decls-dir)
" automatically shows the function signature on method and updatetime is fast
let g:go_auto_type_info = 1
set updatetime=100
" for working wil files
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"maps leader key from \ to ,
let mapleader = ","

" shows only the quickfix error list in vim-go
let g:go_list_type = "quickfix"
" timeout for tests run in vim-go
let g:go_test_timeout = '10s'
" go def vim-go problem when pressing ctrl t for NerdTree
let g:go_def_mapping_enabled=0
" runs always :GoImports before closing the file
let g:go_fmt_command = "goimports"
"runs gometalinter with following commands
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"runs gometalinter on save (closing the file)
let g:go_metalinter_autosave = 1
" marks golang language types - may slow vim down
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" automatically highlights the same variables and functions
let g:go_auto_sameids = 1
"change indentation to 4 spaces
"autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

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

