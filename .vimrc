set nocompatible

"encoding
set encoding=utf-8

"disp
set ruler
set number
set showmatch
set cursorline
set cmdheight=2
set laststatus=2

"move
set whichwrap=b,s,h,l

"file
set nobackup
set noswapfile

"search
set hlsearch
set wrapscan
set incsearch
set smartcase
set ignorecase

"env
set mouse=a
set clipboard=unnamed,autoselect

"indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

"bell
set vb t_vb=
set noerrorbells

"scroll
set scrolloff=10

"color
colorscheme molokai
syntax on

"cursor position
au BufWritePost * mkview
autocmd BufReadPost * loadview

"command
set wildmenu

"insert date <,dd>
inoremap <expr> ,dd strftime('%Y/%m/%d') 

"edit .vimrc <Space>.
nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<Enter>

"keymap
noremap J 10j
noremap K 10k
noremap L 10l
noremap H 10h
noremap j gj
noremap k gk
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap n nzz
nnoremap N Nzz

"ZSpace
function! ZSpace()
  highlight ZSpace cterm=underline ctermbg=yellow gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZSpace
    autocmd!
    autocmd ColorScheme * call ZSpace()
    autocmd VimEnter,WinEnter * match ZSpace /　/
  augroup END
  call ZSpace()
endif

"bundle
function! s:WithoutBundles()
  colorscheme desert
endfunction

function! s:LoadBundles()
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tomasr/molokai'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Lokaltog/vim-easymotion'
endfunction

function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#rc(expand('~/.vim/bundle/'))
      call s:LoadBundles()
    catch
      call s:WithoutBundles()
    endtry
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax on
endfunction

call s:InitNeoBundle()

"nerdtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinPos="right"

"neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_underbar_completion=1
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"emmet
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }

"quickrun 
"markdown preview <\r>
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
\ 'outputter' : 'browser'
\ }

"easymotion
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=";"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
