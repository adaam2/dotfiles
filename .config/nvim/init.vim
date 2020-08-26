" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'chiel92/vim-autoformat'
"Plug 'gko/vim-coloresque'
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

" Begin cocnvim default / sample config
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" End coc nvim config

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
