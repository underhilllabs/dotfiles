set nocompatible
" Colors!!
set t_Co=256

set backupdir=~/.vim/backup_dir
set directory=~/.vim/swap_dir
set title
set noswapfile
set hlsearch

" color theme
" colors zenburn
" colors calmar256-dark
" colors desert256
" colors wombat256
colors xoria256
" colors elflord

call pathogen#infect()
call pathogen#helptags()

set showmode "Alway show the mode we are currently editing in

"Setting the status line...
set statusline=%f       "tail of the filename

"display a warning if the file format isn't Unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isn't UTf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
syntax on
set number
let mapleader = ","

nnoremap <leader>nt :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>nn :set nonumber!<CR>
nnoremap <leader>gt :GitGutterToggle<CR>
nnoremap <leader>ggt :GitGutterToggle<CR>
nnoremap <leader>ggn :GitGutterNextHunk<CR>
nnoremap <leader>ggp :GitGutterPrevHunk<CR>

"print out function names and line numbers
nnoremap <leader>fp :g/function /p<CR>
"clear the search register
nnoremap <silent> <leader>/ :nohlsearch<CR>
"indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END 
endif
syntax on

set hidden "Allow modified buffers to be put in background
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
cmap w!! %!sudo tee > /dev/null %

"use unite.vim like ctrl-p
"nnoremap <C-p> :Unite file_rec/async<cr>
"let g:airline_powerline_fonts=1

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

hi Search cterm=NONE ctermfg=grey ctermbg=blue
