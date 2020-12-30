
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""""""""""""""""
"Run PlugInstall if there are missing plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'''''""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" automatic install plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/battery.vim'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set linebreak
set showbreak=+++
set textwidth=1000
set showmatch
"set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set ruler
set undolevels=1000
set backspace=indent,eol,start
set noshowmode

:nmap <space>e :CocCommand explorer<CR>

"set statusline=2

"set statusline=%{battery}
"set tabline=...%{battery#component()}...



"let g:battery#update_statusline = 1 " For statusline.

"let g:airline#extensions#tabline#formatter#battery = 'default'


"let g:airline_theme='simple'

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline=%{battery#component()}%{coc#status()}%{get(b:,'coc_current_function','')}
