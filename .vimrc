" Ideas: 
" Syntastic
" Tabular
" TMUXLINE.VIM
" update your fucking powerline
" ctrl-p
" vim-workspace
" undotree!!!@
" fzf?
" make sure to add abbreviations for the git fugitive and learn how it works

""""""""""""""""""""""
""" basic configurations 
""""""""""""""""""""""

""" super basic configs 
set number

""" spacing nonsense
set tabstop=4
set expandtab
set shiftwidth=4
set shiftround
set autoindent

""" search
set hlsearch
set ignorecase
" clears search

""" display 
set scrolloff=7
set cursorline
set title 
set background=dark
set t_Co=256                            " do not change this!!!

""" remaps
let mapleader = ","
nnoremap <leader>x :noh<CR>

nnoremap <leader>bn :bn<CR>
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tN :tabNext<CR>
nnoremap <leader>tc :tabclose<CR>

""" misc
set history=1000

""""""""""""""""""""""
""" plugins via vim-plug
""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'              " nerdtree
Plug 'tpope/vim-surround'               " change surrounding braces of sorts
Plug 'vim-airline/vim-airline'          " good powerline at bottom of screen
Plug 'vim-airline/vim-airline-themes'   " themes for airline
Plug 'davidhalter/jedi-vim'             " python autocomplete
Plug 'jiangmiao/auto-pairs'             " pairs parentheses/brackets/etc.
Plug 'scrooloose/nerdcommenter'         " ease of commenting stuff
Plug 'chriskempson/base16-vim'          " cool colorschemes and stuff
Plug 'christoomey/vim-tmux-navigator'   " needed for tmux keybindings and compat.
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


call plug#end()

""""""""""""""""""""""
""" plugin configs
""""""""""""""""""""""

""" NERDTree
" NERDTree now opens if just vim is typed into the command line
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" closes if NT is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>nn :NERDTreeToggle<CR>
let NERDTreeWinSize=35

""" NERDCommenter
let g:NERDSpaceDelims = 1               " adds space when commenting files

""" Airline
let g:airline#extensions#tabline#enabled = 1    " adds in a tabline 
let g:airline#extensions#tabline#formatter = 'unique_tail'

""" ooooh pretty colors
set background=dark
syntax enable

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
