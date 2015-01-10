set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
" Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-endwise'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'wting/rust.vim'

call vundle#end()
filetype plugin indent on

" colorscheme solarized
let g:solarized_termcolors=256
let g:airline_powerline_fonts = 1
set laststatus=2
