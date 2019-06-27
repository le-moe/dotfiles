" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

"leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" Disables autocommenting on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
" set visualbell

" color scheme in terminal
set t_Co=256

" Encoding
set encoding=utf-8

" unsensitive searches
set ignorecase

" share vim and system clipboard
" set clipboard=unnamedplus

" Whitespace
set wrap
set textwidth=0
set wrapmargin=0
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
highlight BadWhitespace ctermbg=red guibg=darkred


" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" move vertically in long line
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd


" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" add new line without entering insert mode
" nnoremap o o<Esc>
" nnoremap O O<Esc>

" delete with d wont save the content to the buffer
" nnoremap d "_d
" vnoremap d "_d
" nnoremap D "_D
" vnoremap D "_D

" nnoremap <leader>d ""d
" vnoremap <leader>d ""d
" nnoremap <leader>D ""D
" vnoremap <leader>D ""D


" Insert newline without entering insert mode and stay on the current line
" nmap <S-Enter> Oj
" nmap <CR> koj



" toogle NerdTree
nmap <F6> :NERDTreeToggle<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" flag unecessary white space
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Automatically delete trailing white space on save
autocmd BufWritePre * %s/\s\+$//e

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

" $$$$$$$$$$$$$ PYTHON Specific $$$$$$$$$$$$$$$$

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe - autoclose window when done
let g:ycm_autoclose_preview_window_after_completion=1

" YouCompleteMe - shortcut for definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

" map F9 to autoexec python script
nnoremap <buffer> <F9> :w<CR>:!clear<CR> :exec '!python3' shellescape(@%, 1)<cr>

" UTF-8
set encoding=utf-8

" $$$$$$$$$$$$$ Plugins $$$$$$$$$$$$ "
" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" color scheme
colo kuroi

" bind fuzzy finder to ;
map ; :Files<CR>

" shortcut for ysWf:    hello  ysWfprint<cr>     print("hello")
map µ ysWf

" stop autowrapping of long lines
set textwidth=0
set wrapmargin=0

"quick window switch
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" natural window split
set splitbelow
set splitright

" set path for :find myfile.txt
set path=.,usr/include,/opt/odoo12,**

" store swap file in a single local directory
set directory=~/.vim/swap,.

" use cword to get the word under the cursor.
" Search for it in the current directory and all subdirectories.
" Then it open the quickfix bar
" map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
