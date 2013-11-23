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

"neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_underbar_completion=1
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"insert date
inoremap <expr> ,dd strftime('%Y/%m/%d') 

"edit .vimrc 
nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<Enter>
