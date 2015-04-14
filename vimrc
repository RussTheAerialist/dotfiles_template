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
Plugin 'tpope/vim-dispatch'
Plugin 'geekjuice/vim-mocha'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sirtaj/vim-openscad'

if filereadable(expand("$HOME/.dotfiles/rust"))
  Plugin 'wting/rust.vim'
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

"   Quit vim if nerdtree is the last window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
map <Leader>t :Dispatch<CR>

" Tab Settings
set expandtab  " spaces > tabs
set shiftwidth=4
set softtabstop=4

" Git Gutter Settings
let g:gitgutter_sign_column_always = 1
let g:gitgutter_highlight_lines = 1
