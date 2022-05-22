" NOTE: 弊害が多いので、ファイルタイプ検出は無効にしておく。
filetype off

" NOTE: プラグイン読込 (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'dbakker/vim-paragraph-motion'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'haya14busa/vim-edgemotion'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prettier/vim-prettier'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/vim-auto-save'
call plug#end()

" NOTE: <D-c> と <D-v> でコピペ出来るようにする。(MacOS クリップボード連携)
set clipboard=unnamedplus

" NOTE: 行番号を表示する。
set number

" NOTE: マウス操作を全て有効にする。
set mouse=a

" NOTE: 言語の文法に準拠した折りたたみ挙動を行う。
set foldmethod=syntax

" NOTE: 文字を配色する際に、背景色が暗いことを前提として想定する。
set background=dark

" NOTE: インデント見た目上の幅を 2 スペースにする。
set shiftwidth=2

" NOTE: 自動的にインデントする。
set smartindent

" NOTE: インクリメンタルサーチを有効にする。
set incsearch

" NOTE: 検索結果のハイライトを有効にする。
set hlsearch

" NOTE: 数値を全て 10 進数とみなす。
set nrformats=

" NOTE: シンタックスハイライトを有効にする。
syntax enable

" NOTE: 自動保存を有効にする。(サイレントで保存する)
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save = 1

" NOTE: :Tk で、ターミナルバッファを上に開く。
command! -nargs=* Tk split | wincmd k | terminal <args>

" NOTE: :Tj で、ターミナルバッファを下に開く。
command! -nargs=* Tj split | wincmd j | terminal <args>

" NOTE: :Th で、ターミナルバッファを左のウィンドウに開く。
command! -nargs=* Th vsplit | terminal <args>

" NOTE: :Tl で、ターミナルバッファを右のウィンドウに開く。
command! -nargs=* Tl vsplit | wincmd l |terminal <args>

" NOTE: Neovim ターミナルバッファのカスタマイズ
augroup neovim_terminal
    autocmd!

    " NOTE: ターミナルバッファを起動した際、デフォルトで INSERT モードにしておく。
    autocmd TermOpen * startinsert

    " NOTE: ターミナルバッファに行番号を表示しない。
    autocmd TermOpen * :set nonumber norelativenumber

    " NOTE: ターミナルバッファで <C-c> による中断を使えるようにする。
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>

    " NOTE: <Esc> で TERMINAL モードから脱出できるようにする。
    :tnoremap <Esc> <C-\><C-n>
augroup END

" NOTE: EasyMotion で移動する際、日本語をローマ字で検索出来るようにする。
let g:EasyMotion_use_migemo = 1

" NOTE: EasyMotion で移動した際、カーソル位置をキープする。
let g:EasyMotion_startofline = 0

" NOTE: Fern で NerdFont を表示する。
let g:fern#renderer = 'nerdfont'

" NOTE: Fern のデフォルトキーバインディングを無効化する。
let g:fern#disable_default_mappings = 1

" Fern バッファのカスタマイズ
function! s:init_fern() abort
  " NOTE: Fern のキーバインディングを設定する。(s1 で開閉出来なくなるので s を空けている以外はデフォルトのまま)
  noremap <buffer> <C-C>                              <Plug>(fern-action-cancel)
  noremap <buffer>                                    <Plug>(fern-action-cd)
  noremap <buffer> <Plug>(fern-action-cd)             <Plug>(fern-action-cd:cursor)
  noremap <buffer> a                                  <Plug>(fern-action-choice)
  noremap <buffer>                                    <Plug>(fern-action-clipboard-clear)
  noremap <buffer> C                                  <Plug>(fern-action-clipboard-copy)
  noremap <buffer> M                                  <Plug>(fern-action-clipboard-move)
  noremap <buffer> P                                  <Plug>(fern-action-clipboard-paste)
  noremap <buffer> h                                  <Plug>(fern-action-collapse)
  noremap <buffer> c                                  <Plug>(fern-action-copy)
  noremap <buffer>                                    <Plug>(fern-action-debug)
  noremap <buffer>                                    <Plug>(fern-action-diff)
  noremap <buffer> <Plug>(fern-action-diff)           <Plug>(fern-action-diff:edit)
  noremap <buffer> <Plug>(fern-action-diff:edit)      <Plug>(fern-action-diff:edit-or-error)
  noremap <buffer> <Plug>(fern-action-diff:edit:vert) <Plug>(fern-action-diff:edit-or-error:vert)
  noremap <buffer> <Plug>(fern-action-diff:vert)      <Plug>(fern-action-diff:edit:vert)
  noremap <buffer>                                    <Plug>(fern-action-enter)
  noremap <buffer>                                    <Plug>(fern-action-ex)
  noremap <buffer>                                    <Plug>(fern-action-ex=)
  noremap <buffer> fe                                 <Plug>(fern-action-exclude)
  noremap <buffer>                                    <Plug>(fern-action-exclude=)
  noremap <buffer>                                    <Plug>(fern-action-expand)
  noremap <buffer> <Plug>(fern-action-expand)         <Plug>(fern-action-expand:in)
  noremap <buffer>                                    <Plug>(fern-action-grep)
  noremap <buffer>                                    <Plug>(fern-action-grep=)
  noremap <buffer> ?                                  <Plug>(fern-action-help)
  noremap <buffer> !                                  <Plug>(fern-action-hidden)
  noremap <buffer> <Plug>(fern-action-hidden)         <Plug>(fern-action-hidden:toggle)
  noremap <buffer> fi                                 <Plug>(fern-action-include)
  noremap <buffer>                                    <Plug>(fern-action-include=)
  noremap <buffer>                                    <Plug>(fern-action-lcd)
  noremap <buffer> <Plug>(fern-action-lcd)            <Plug>(fern-action-lcd:cursor)
  noremap <buffer> <C-H>                              <Plug>(fern-action-leave)
  noremap <buffer> -                                  <Plug>(fern-action-mark)
  noremap <buffer> <Plug>(fern-action-mark)           <Plug>(fern-action-mark:toggle)
  noremap <buffer> m                                  <Plug>(fern-action-move)
  noremap <buffer> K                                  <Plug>(fern-action-new-dir)
  noremap <buffer>                                    <Plug>(fern-action-new-dir=)
  noremap <buffer> N                                  <Plug>(fern-action-new-file)
  noremap <buffer>                                    <Plug>(fern-action-new-file=)
  noremap <buffer>                                    <Plug>(fern-action-new-path)
  noremap <buffer>                                    <Plug>(fern-action-new-path=)
  noremap <buffer> e                                  <Plug>(fern-action-open)
  noremap <buffer> <C-M>                              <Plug>(fern-action-open-or-enter)
  noremap <buffer> l                                  <Plug>(fern-action-open-or-expand)
  noremap <buffer> <Plug>(fern-action-open)           <Plug>(fern-action-open:edit)
  noremap <buffer> <Plug>(fern-action-open:edit)      <Plug>(fern-action-open:edit-or-error)
  " noremap <buffer> s                                  <Plug>(fern-action-open:select)
  noremap <buffer> E                                  <Plug>(fern-action-open:side)
  noremap <buffer> x                                  <Plug>(fern-action-open:system)
  noremap <buffer> t                                  <Plug>(fern-action-open:tabedit)
  noremap <buffer> <C-L>                              <Plug>(fern-action-redraw)
  noremap <buffer> <F5>                               <Plug>(fern-action-reload)
  noremap <buffer> <Plug>(fern-action-reload)         <Plug>(fern-action-reload:all)
  noremap <buffer>                                    <Plug>(fern-action-remove)
  noremap <buffer>                                    <Plug>(fern-action-remove=)
  noremap <buffer> R                                  <Plug>(fern-action-rename)
  noremap <buffer> <Plug>(fern-action-rename:edit)    <Plug>(fern-action-rename:edit-or-error)
  noremap <buffer> <Plug>(fern-action-rename)         <Plug>(fern-action-rename:split)
  noremap <buffer> .                                  <Plug>(fern-action-repeat)
  noremap <buffer> i                                  <Plug>(fern-action-reveal)
  noremap <buffer>                                    <Plug>(fern-action-reveal=)
  noremap <buffer>                                    <Plug>(fern-action-tcd)
  noremap <buffer> <Plug>(fern-action-tcd)            <Plug>(fern-action-tcd:cursor)
  noremap <buffer>                                    <Plug>(fern-action-terminal)
  noremap <buffer> <Plug>(fern-action-terminal)       <Plug>(fern-action-terminal:edit)
  noremap <buffer> <Plug>(fern-action-terminal:edit)  <Plug>(fern-action-terminal:edit-or-error)
  noremap <buffer> D                                  <Plug>(fern-action-trash)
  noremap <buffer>                                    <Plug>(fern-action-trash=)
  noremap <buffer> y                                  <Plug>(fern-action-yank)
  noremap <buffer> <Plug>(fern-action-yank)           <Plug>(fern-action-yank:path)
  noremap <buffer> z                                  <Plug>(fern-action-zoom)
  noremap <buffer> Z                                  <Plug>(fern-action-zoom:reset)

" NOTE: Fern の行番号を非表示にする。
  setlocal nonumber
endfunction

" NOTE: lualine 初期化
lua << END
  require('lualine').setup {
    options = {
      component_separators = '',
      section_separators = ''
    },
    sections = {
      lualine_a = {},
      lualine_b = {'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'filetype', 'location', 'fileformat', 'encoding', 'branch'},
      lualine_y = {},
      lualine_z = {}
    }
  }
END

" NOTE: Fern バッファの初期化時に init_fern 関数が実行されるようにする。
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" NOTE: coc.nvim プラグインのインストール
let g:coc_global_extensions = [
      \'coc-clangd',
      \'coc-css',
      \'coc-elixir',
      \'coc-eslint',
      \'coc-fzf-preview',
      \'coc-html',
      \'coc-json',
      \'coc-prettier',
      \'coc-tsserver'
\]

" NOTE: リーダーキーをスペースキーにする。
let mapleader = "\<space>"

" NOTE: 元々の s キーの挙動を m キーに割り当てる。(カーソル位置の文字を消してインサート)
noremap m s
noremap s m

" NOTE: Shift + u でやり直す。
nnoremap U <c-r>

" NOTE: emmet をタブキーで展開する。
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" NOTE: EasyMotion のプレフィクスをリーダーキーにする。
map <Leader> <Plug>(easymotion-prefix)

" NOTE: gk で新規タブ作成
nnoremap gk :tabnew<CR>

" NOTE: gj でタブを閉じる
nnoremap gj :bd<CR>

" NOTE: zj で下に合わせる。
nnoremap zj zt

" NOTE: zk で上に合わせる。
nnoremap zk zb

" NOTE: s キーで Fern 開閉する。
nmap s1 :Fern . -drawer -toggle<CR>

" NOTE: s キーで EasyMotion 検索を実行する。
" nmap s <Plug>(easymotion-s2)
" xmap s <Plug>(easymotion-s2)

" NOTE: リーダーキー + hjkl で上下左右に移動する。
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" NOTE: Ctrl キー + jk で上下に移動する。
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" NOTE: <Leader> + f をファジー検索の予備動作にする。
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

" NOTE: <Leader> + fo でファイル検索する。(プロジェクトの全ファイルが対象)
nnoremap <silent> [fzf-p]o :<C-u>CocCommand fzf-preview.ProjectFiles<CR>

" NOTE: <Leader> + fe でファイル検索する。(プロジェクトで最近開いたファイルが対象)
nnoremap <silent> [fzf-p]e :<C-u>CocCommand fzf-preview.ProjectMruFiles<CR>

" NOTE: <Leader> + ff で文字列検索する。(プロジェクトの全ファイルが対象)
nnoremap <silent> [fzf-p]f :<C-u>CocCommand fzf-preview.ProjectGrep<Space>

" NOTE: <Leader> + fF で直前の文字列検索を再実行する。(プロジェクトの全ファイルが対象)
nnoremap <silent> [fzf-p]<S-f> :<C-u>CocCommand fzf-preview.ProjectGrepRecall<CR>

" NOTE: s0 で Git の操作画面を開く。
nnoremap <silent> s0 :<C-u>CocCommand fzf-preview.GitActions<CR>




" nmap <Leader>rn <Plug>(coc-rename)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gr <Plug>(coc-references)
