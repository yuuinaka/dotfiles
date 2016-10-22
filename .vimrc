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
"grep
nnoremap cn :cnext<CR>
nnoremap cp :cprevious<CR>
"paste
"nnoremap p "0p
"nnoremap P "0P

"vue
autocmd BufNewFile,BufRead *.vue set filetype=html

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

"dein
let g:rc_dir = expand('~/.vim/rc')
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  "toml
  let s:toml      = g:rc_dir . '/dein.toml'
  "let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

"nerdtree
autocmd vimenter * NERDTree
autocmd vimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
\   'variables' : {
\     'lang' : "ja"
\   },
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

syntax on

