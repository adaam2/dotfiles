" Plugins
call plug#begin('~/.vim/plugged')
Plug 'chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'roman/golden-ratio'
Plug 'janko/vim-test'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'flazz/vim-colorschemes'
call plug#end()

" Basic setup
set nocompatible
syntax on
filetype plugin indent on
set autoread
set lazyredraw

" Indentation
set cindent
set autoindent

" Tab handling
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2

" Splits handling
set splitright
set splitbelow

" Paste / clipboard
set clipboard=unnamed

" Cursorline
set cursorline

" Bracket matching
set showmatch

" Searching
set incsearch  " Find as you type
set hlsearch   " Hilight search
set ignorecase " Case insensitive search
set smartcase  " Case sensitive when uc present

" Line numbers - relative
set nu
set rnu

" Tab / untab in v-block mode
vmap <Tab> >gv
vmap <S-Tab> <gv

set mouse=a   " Enable mouse
set mousehide " Hide mouse cursor while typing

" Leader key config
let mapleader=","

" Fix yank defaults not yanking from cursor
nnoremap Y y$

" Use jk instead of escape
inoremap jk <esc>

" Edit vimrc using , + ev
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source the updated vimrc again
nnoremap <leader>sv :source $MYVIMRC<cr>

" Autoformat file
nnoremap <leader>q :Autoformat<CR>

" Undo / redo
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>

" For insert mode, you still need to run a normal mode command. You can include <Esc> in mappings to leave insert mode, but in this case you can also use <C-O> to run a single normal mode command while remaining in insert mode (See :help i_CTRL-O):

inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

" Theme
colorscheme Monokai
set background=dark

" NerdTree
nmap <c-T> :NERDTreeToggle<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$',
      \ '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" NerdCommenter
let NERDCreateDefaultMappings = 0
" Map toggle comment
map <silent><Leader>c<space> <Plug>NERDCommenterToggle

" Indent Guides {{{
" Enable guides on vim startup
let g:indent_guides_enable_on_vim_startup = 1
" Set guides size to be slim
let g:indent_guides_guide_size = 1
" Disable guides for...
let g:indent_guides_exclude_filetypes = ['help']
" Disable indent guides mapping
let g:indent_guides_default_mapping = 0
" }}}

" FZF {{{
set rtp+=/usr/local/opt/fzf
nmap <leader><tab> <Plug>(fzf-maps-n)
imap <leader><tab> <Plug>(fzf-maps-i)
xmap <leader><tab> <Plug>(fzf-maps-x)

" Use ctrl + p to filter all project files fuzzily
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Ag<CR>
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

