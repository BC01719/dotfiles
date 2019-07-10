" Robert Colley's Vimrc Configuration "
set encoding=utf8
syntax on
filetype plugin indent on

colorscheme default
highlight Comment ctermfg=Blue
hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad ctermfg=red 

set spell
set ruler
set showcmd
set nowrap
set sidescroll=16
set so=4

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
autocmd FileType text setlocal textwidth=78

set number

set hlsearch
set incsearch

imap jk <ESC>
nnoremap <F5> :buffers<CR>:buffer<Space>
