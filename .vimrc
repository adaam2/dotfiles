" Plugins
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'chiel92/vim-autoformat'
Plug 'gko/vim-coloresque'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'roman/golden-ratio'
Plug 'danishprakash/vim-githubinator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
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
set clipboard=unnamedplus

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

" Enable guides on vim startup
let g:indent_guides_enable_on_vim_startup = 1
" Set guides size to be slim
let g:indent_guides_guide_size = 1
" Disable guides for...
let g:indent_guides_exclude_filetypes = ['help']
" Disable indent guides mapping
let g:indent_guides_default_mapping = 0

" FZF
set rtp+=/usr/local/opt/fzf
nmap <leader><tab> <Plug>(fzf-maps-n)
imap <leader><tab> <Plug>(fzf-maps-i)
xmap <leader><tab> <Plug>(fzf-maps-x)

" Use ctrl + p to filter all project files fuzzily
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Ag<CR>

" Airline config
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#fugutive#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Coc neo vim configuration
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Next by Tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#rpc#request('doKeymap', ['snippets-expand', "\<TAB>"])

" Previous by Tab
inoremap <silent><expr><S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \<SID>check_back_space() ? "\<S-Tab>" :
      \ coc#rpc#request('doKeymap', ['snippets-expand', "\<S-Tab>"])

" use <c-space>for trigger completion
imap <expr><c-space> coc#refresh()

" Don't go to new line on enter when completing
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <C-l> to trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> to select text for visual text of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Show doc
function! s:show_doc()
  if &filetype == 'vim'
    execute 'h ' . expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_doc()<CR>

" GoTos
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gq <Plug>(coc-codeaction)

" Other helpful stuff
nnoremap <silent><leader>gc :call CocAction('codeAction')<CR>
nnoremap <silent><leader>gr :call CocAction('rename')<CR>
"nnoremap <silent><leader>gq :call CocAction('quickfixes')<CR>
nnoremap <silent><leader>gh :CocList<CR>

let test#go#richgo#options = '--mod=vendor'
let test#ruby#rspec#options = {
      \ 'nearest': '--backtrace',
      \ 'file':    '--format documentation',
      \ 'suite':   '',
      \}
let test#go#runner = 'richgo'
let g:test#preserve_screen = 1
let test#strategy = "vimterminal"
let g:test#javascript#jest#file_pattern = '*.(spec|test))\.(js|jsx|coffee|ts|tsx)$'

nnoremap <leader>tt :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ta :TestSuite<cr>
nnoremap <leader>tl :TestLast<cr>
nnoremap <leader>tg :TestVisit<cr>
