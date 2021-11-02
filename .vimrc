filetype off
filetype plugin indent off

call plug#begin('~/.vim/plugged')
Plugin 'airblade/vim-gitgutter'
Plugin 'dbakker/vim-paragraph-motion'
Plugin 'easymotion/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'haya14busa/vim-edgemotion'
Plugin 'inkarkat/vim-ReplaceWithRegister'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'leafgarland/typescript-vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdtree'
Plugin 'prettier/vim-prettier'
Plugin 'Quramy/tsuquyomi'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'elixir-editors/vim-elixir'
Plugin 'jason0x43/vim-js-indent'
Plugin 'mhartington/vim-typings'
Plugin 'Quramy/vim-dtsm'
call plug#end()

set clipboard=unnamedplus
set number
set mouse=a
set foldmethod=syntax
set background=dark
set shiftwidth=2
set autoindent
set smartindent
set incsearch
set hlsearch
set nrformats=

syntax on

let g:typescript_indent_disable = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save = 1
let g:netrw_banner=0
let g:multi_cursor_start_word_key      = '<A-n>'
let g:multi_cursor_skip_key            = '<A-x>'
let g:multi_cursor_prev_key            = '<A-p>'
let g:multi_cursor_start_key           = 'g<A-n>'
let g:EasyMotion_use_migemo = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let mapleader = "\<space>"

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
noremap m s
noremap s m
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)
