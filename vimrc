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
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-dispatch'
Plugin 'geekjuice/vim-mocha'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sirtaj/vim-openscad'
Plugin 'davidhalter/jedi-vim'
Plugin 'racer-rust/vim-racer'
Plugin 'rizzatti/dash.vim'

if filereadable(expand("$HOME/.dotfiles/rust"))
  Plugin 'wting/rust.vim'
endif

Plugin 'sudar/vim-arduino-syntax'

call vundle#end()
filetype plugin indent on

" Color Syntax Highlighting Configuration
syntax enable
set background=light
colorscheme solarized

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline_mode_map = { '__': '--', 'n': 'N', 'i': 'I', 'R': 'R', 'v': 'V', 'V': 'V-', 'c': 'C', 's': 'S', 'S': 'S-', 't': 'T' }
set laststatus=2

" NERDTree Configuration
"   Key bindings
    map <C-n> :NERDTreeToggle<CR>

"   Quit vim if nerdtree is the last window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let mapleader = ','
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
map <Leader>t :Dispatch<CR>
map <Leader>d <Plug>DashSearch

" Tab Settings
set expandtab  " spaces > tabs
set shiftwidth=2
set softtabstop=2

" Git Gutter Settings
let g:gitgutter_sign_column_always = 1
let g:gitgutter_highlight_lines = 1

" jedi-vim
let g:jedi#show_call_signatures="2"

" special indent settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.fountain set filetype=fountain
