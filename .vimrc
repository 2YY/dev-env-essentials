filetype off
filetype plugin indent off

call plug#begin('~/.vim/plugged')
Plug 'dbakker/vim-paragraph-motion'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'haya14busa/vim-edgemotion'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-highlightedyank'
Plug 'mattn/emmet-vim'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'git://git.wincent.com/command-t.git'
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
let g:netrw_banner = 0
let g:multi_cursor_start_word_key = '<A-n>'
let g:multi_cursor_skip_key = '<A-x>'
let g:multi_cursor_prev_key = '<A-p>'
let g:multi_cursor_start_key = 'g<A-n>'
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

:command Ner NERDTree
:command Nerf NERDTreeFocus
:command Nert NERDTreeToggle

noremap <C-l> :LspPeekDefinition
