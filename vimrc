set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'Valloric/YouCompleteMe'

if filereadable(expand("$HOME/.dotfiles/rust"))
  Plugin 'wting/rust.vim'
  Plugin 'phildawes/racer'
endif

Plugin 'sudar/vim-arduino-syntax'

call vundle#end()
filetype plugin indent on

" Color Syntax Highlighting Configuration
syntax enable
set background=dark
colorscheme solarized
let g:airline_powerline_fonts = 1
set laststatus=2

" NERDTree Configuration
"   Key bindings
    map <C-n> :NERDTreeToggle<CR>

"   Start nerdtree if you just start vim without files
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"   Quit vim if nerdtree is the last window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Pane Key Bindings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab Settings
set expandtab  " spaces > tabs
set shiftwidth=4
set softtabstop=4

" Git Gutter Settings
let g:gitgutter_sign_column_always = 1
let g:gitgutter_highlight_lines = 1
