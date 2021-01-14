"Run PlugInstall if there are missing plugins
""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

set nocompatible

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'co1ncidence/bliss'
Plug 'bling/vim-bufferline'
Plug 'chriskempson/base16-vim'
"Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
"Plug 'lambdalisue/battery.vim'
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

let g:bufferline_echo = 1
let g:airline_powerline_fonts = 1
set statusline=2
let g:bufferline_inactive_highlight = 'StatusLineNC'
let g:bufferline_active_highlight = 'StatusLine'
let g:bufferline_modified = '*'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0

"Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"let base16colorspace=256
"colorscheme
"colorscheme base16-default-dark
"set noswapfile
