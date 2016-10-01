set nocompatible              " required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"  let Vundle manage Vundle, required
" Add all your plugins here

Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Map leader key
let mapleader=","

set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" PEP8 indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

au BufNewFile,BufRead *.py
    \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix |


" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" YCM settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Make code look pretty (not sure if this effects anything) 
let python_highlight_all=1
syntax enable  

" Use 256 colors (use this setting only if your terminal supports 256 colors)
set t_Co=256

" Set background
if has('gui_running')
    set background=light
else
    set background=dark
endif

" Set colorscheme
colorscheme solarized 

" NERDTree toggle mapping
map <C-n> :NERDTreeTabsToggle<CR>

" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Set line numbers
set nu

" Show Vim statusline
set laststatus=2
