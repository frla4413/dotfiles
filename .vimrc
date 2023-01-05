" ---------------------- vim-plug -----------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cdelledonne/vim-cmake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
"Plug 'Valloric/YouCompleteMe'
"Plug 'nvie/vim-flake8'
call plug#end()
" -------------------------------------------------

set encoding=utf-8
set termencoding=utf-8
set tabstop=2 shiftwidth=2 expandtab    " Turn tabs into spaces
set hlsearch                            " Highlight search
set cursorline                          " Higlight current line
set autoread                     " Automatically load file changes
set autochdir                   " Automatically change directory to current file
set viminfo+=n~/.vim/viminfo            " Set location of viminfo
set list listchars=tab:»·,trail:·      " Show trailing whitespaces

set timeoutlen=1000
set ttimeout
set ttimeoutlen=0
set undolevels=1000

map <C-n> gt
map <C-Tab> gt
map <C-p> gT
map <C-S-Tab> gT
map <C-t> :tabnew<cr>

set noswapfile
set nobackup
set number
syntax on

set background=dark  "to get correct colors in tmux

let mapleader="\<Space>"
let maplocalleader="\<Space>"

hi Pmenu ctermbg=black ctermfg=white

"Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_fold_docstring=1

"YCM
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"vim-cmake
"let g:cmake_default_config = 'Debug'
let g:cmake_link_compile_commands = 1
map <leader>cg :CMakeGenerate<cr>
map <leader>cd :CMakeSwitch Debug<cr>
map <leader>cr :CMakeSwitch Release<cr>
map <leader>cb :CMakeBuild<cr>
map <leader>cq :CMakeClose<cr><buffer> <leader>p :exec '!python' shellescape(@%, 1)<cr>

"vimtex
syntax enable
let g:vimtex_view_method = 'zathura'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,bibtex,pdf'
let g:vimtex_view_general_viewer = 'xdg-open'
let g:tex_flavor = 'pdflatex'
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'

"Fugitive
map <Leader>gs :Git<cr>
map <Leader>gd :Git diff<cr>
map <Leader>gc :Git commit<cr>
map <Leader>gl :Git log<cr>
map <Leader>gp :Git push<cr>
map <Leader>gr :Git read<cr>
map <Leader>go :Git checkout<Space>
map <Leader>gb :Git branch<Space>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"CtrlP
let g:ctrlp_map='§'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_by_filename=1
let g:ctrlp_switch_buffer=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-e> :TmuxNavigatePrevious<cr>
autocmd FileType python nnoremap<buffer> <leader>p :call VimuxRunCommand("python " . bufname("%"))<cr>

let g:VimuxHeight = "50"
let g:VimuxOrientation = 'h'
let g:VimuxUseNearestPane = 0

" Fix CocErrorHighlight in tmux
hi CocErrorHighlight gui=underline term=underline cterm=underline
hi CocWarningHighlight gui=underline term=underline cterm=underline


"supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
