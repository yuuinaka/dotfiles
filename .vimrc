set nocompatible

"encoding
set encoding=utf-8

"disp
set ruler
set number
set showmatch
set matchtime=1
set cursorline
set cmdheight=2
set laststatus=2
set pumheight=10
set ambiwidth=double
set display=lastline

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
set grepprg=internal

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
"colorscheme molokai
colorscheme jellybeans
"colorscheme iceberg
syntax on

"cursor position
au BufWritePost * mkview
autocmd BufReadPost * loadview

"command
set wildmenu

"keymap
"move
noremap J 5j
noremap K 5k
noremap L 5l
noremap H 5h
nnoremap j gj
xnoremap j gj
nnoremap k gk
xnoremap k gk
nnoremap n nzz
nnoremap N Nzz
noremap <Tab> <C-w>w
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap Y y$
"count
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap ,w :%s///gn<CR>
nnoremap ,c :%s/.//gn<CR>
"alt ESC
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
"insert date <,dd>
inoremap <expr> ,dd strftime('%Y/%m/%d') 
"edit .vimrc <Space>.
nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<CR>
"insert complete
"inoremap { {}<Left>
"inoremap [ []<Left>
"inoremap ( ()<Left>
"inoremap " ""<Left>
"inoremap ' ''<Left>
"inoremap < <><Left>

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

"numberwidth
augroup numberwidth
  autocmd!
  autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END

"bundle
function! s:WithoutBundles()
  colorscheme desert
endfunction

function! s:LoadBundles()
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tomasr/molokai'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'cocopon/iceberg.vim'
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
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'tmhedberg/matchit'
  NeoBundle 'groenewege/vim-less'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'osyo-manga/vim-over'
endfunction

function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#begin(expand('~/.vim/bundle/'))
      call s:LoadBundles()
      call neobundle#end()
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
\   'lang' : 'ja',
\   'javascript' : {
\     'snippets' : {
\       'jq' : "\\$(function() {\n\t${cursor}${child}\n});"
\     }
\   }
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

"indentLine
let g:indentLine_faster = 1
