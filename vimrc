"  _ _ _ _ _ _ _
" |  - - - -    |
" | |      / /| |    Zack Traczyk (zbuck)
" | |   / /   | |
" | |/ / _ _ _| |    http://zacktraczyk.com
" |  _ _   _ _  |    https://github.com/xxzbuckxx
" | |_ _| |_ _| |
" |_ _ _ _ _ _ _|
"
" Customized congfig for vim (https://www.vim.org/)
"
" -- SETUP --
" Install coc.nvim (https://github.com/neoclide/coc.nvim)
" Add Vim Plug into .vim/autoload (https://github.com/junegunn/vim-plug)
" Create .vim/plugged directory
" Source and run :PlugInstall

" Move Dotfiles to .config and .cache
set directory=$CACHE/vim,~/,/tmp
set backupdir=$CACHE/vim,~/,/tmp
set viminfo+=n.cache/vim/viminfo
set runtimepath=$HOME/.config/vim,$HOME/.config/vim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$HOME/.config/vim/vimrc" " vimrc in dotfiles repo

" -------------- Plugins --------------


call plug#begin('$HOME/.cache/vim/plugged')

" Git Wrapper
Plug 'tpope/vim-fugitive'

" Universal Vim Defaults
Plug 'tpope/vim-sensible'

" Comment (gcc)
Plug 'tpope/vim-commentary'

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" PEP8 Python indentation
Plug 'vim-scripts/indentpython.vim'

" Javascript syntax
Plug 'maksimr/vim-jsbeautify'
Plug 'maxmellon/vim-jsx-pretty'

" Startify UI
Plug 'mhinz/vim-startify'

" Color scheme
Plug 'sainnhe/everforest'

" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Highlight after yank
Plug 'machakann/vim-highlightedyank'

" Goyo
Plug 'junegunn/goyo.vim'

" vimwiki - notetaking
Plug 'vimwiki/vimwiki'

" calendar for vimwiki
Plug 'mattn/calendar-vim'

" vimtex - LaTeX
Plug 'lervag/vimtex'

call plug#end()

" -------------- Buffer Config  --------------
syntax on

let mapleader="\<space>"
let maplocalleader="\<space>"

set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set splitbelow
set encoding=utf-8

" For vimwiki
if &compatible | set nocompatible | endif " Avoid side effects if `nocp` already set
filetype plugin on


" No beep/flash
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Colorscheme
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

set background=dark
let g:everforest_background = 'hard'
let g:everforest_transparent_background = 1
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_current_word = 'bold'
let g:everforest_enable_italic = 1

colorscheme everforest
let g:airline_theme='everforest'

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Jump Buffer
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>

" Goyo
map <leader>gy :Goyo<CR>

" Jump to placeholder
nnoremap <space><space> <Esc>/<++><Enter>"_c4l

" Autocomplete braces
inoremap {<cr> {<cr>}<esc>O

" Resfresh dwmblocks when config edited
autocmd BufWritePost ~/.config/suckless/dwmblocks/blocks.h !cd ~/Software/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }

" -------------- Language Specific Config --------------

" Groff

autocmd BufWritePost *.ms !groff -ms -rPS=12 -U -T pdf % > %:r.pdf

" C

au BufNewFile,BufRead *.c
			\ set expandtab       |" replace tabs with spaces
			\ set autoindent      |" copy indent when starting a new line
			\ set tabstop=4
			\ set softtabstop=4
			\ set shiftwidth=4


" HTML/CSS/JS

au BufNewFile,BufRead *.js
			\ set expandtab       |" replace tabs with spaces
			\ set autoindent      |" copy indent when starting a new line
			\ set tabstop=2
			\ set softtabstop=2
			\ set shiftwidth=2


" Python

au BufNewFile,BufRead *.py
			\ set expandtab       |" replace tabs with spaces
			\ set autoindent      |" copy indent when starting a new line
			\ set tabstop=4
			\ set softtabstop=4
			\ set shiftwidth=4

" Runs Python Code in Terminal
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear; python' shellescape(@%, 1)<CR>

" Set spell
autocmd FileType text,latex,nroff,markdown set spell

" Highlight after 80 lines
autocmd FileType python,tex,latex,nroff highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python,tex,latex,nroff match OverLength /\%81v.\+/


" ------------ Vimwiki/ TeX -------------

" Code Syntax highlighting
let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'c': 'c'}
let g:vimwiki_list = [wiki]

" Run multiple wikis
let g:vimwiki_list = [
			\ {'path': '~/4\ Archives/Vimwiki/',
			\ 'syntax': 'markdown', 'ext': '.md'}
			\ ]

" default TeX as LaTeX
let g:tex_flavor = "latex"

" Spell Check and auto-completion
autocmd FileType markdown,tex,latex,nroff setlocal spell
autocmd FileType markdown,tex,latex,nroff setlocal complete+=kspell
autocmd FileType markdown,tex,latex,nroff setlocal wrap


" -------------- COC Config --------------

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
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

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
