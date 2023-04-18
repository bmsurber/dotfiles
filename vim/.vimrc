"runtime bundle/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect()
set t_Co=256
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"
set background=dark
colorscheme gruvbox
set path+=**
set nocompatible
syntax on
filetype plugin indent on
set showcmd	    	" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch        " Highlight search results
set incsearch		" Incremental search
set mouse=a	       	" Enable mouse usage (all modes)
set encoding=utf-8    " consistent character encoding
set autoindent        " always set autoindenting on
set smartindent       " trying out smartindent for C
set foldenable
set foldmethod=indent " default fold method
set foldlevel=99
"set foldnestmax=1
"set foldminlines=5
"set foldcolumn=2
"set laststatus=2
"set colorcolumn=80
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set scrolloff=3
set smarttab
set number
"set relativenumber
set wildmenu
set lazyredraw
set backspace=2
let mapleader=" "
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>c "+y
nnoremap <leader>v "+p
nnoremap <leader>f za
nnoremap <leader>b oimport pdb; pdb.set_trace()<esc>
nnoremap <leader>B Oimport pdb; pdb.set_trace()<esc>
nnoremap <leader>r :w<CR>:!clear<CR>:!python3 -i %<CR><CR>
inoremap jk <ESC>
inoremap kj <ESC>
vnoremap < <gv
vnoremap > >gv
nnoremap <F7> :set bg=dark<CR>
nnoremap <F8> :set bg=light<CR>
nnoremap <F9> :hi Normal ctermbg=none<CR>
nnoremap <leader>/ :nohlsearch<CR>
let g:user_emmet_leader_key='<C-e>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
inoremap {<CR> {<CR>}<Esc>O
