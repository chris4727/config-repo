"========================================
" .vimrc
"========================================

" General settings
"========================================
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number
set relativenumber
set scrolloff=10
set showmode
set showcmd
set nobackup
set nocursorline
set history=1000
set guifont=Fira\ Code\ Nerdfont:12

" Layout
"========================================
set shiftwidth=4
set tabstop=4
set autoindent

" Line wrapping
"========================================
" To wrap line at end of wrap point, use `gqq'
"set nowrap
"set textwidth=72
"Set the character number where colorcolumn appears
set colorcolumn=80
"Change GUI colorcolumn to black.
highlight ColorColumn guibg=Black
"Changes terminal colorcolumn to black.
highlight ColorColumn ctermbg=0

" Enable autocomplete:
"========================================
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.img,.xlsx

" Spellcheck
"========================================
set spell
hi clear SpellBad
hi SpellBad cterm=underline
"set spelllang=eng_us "Add new iso codes comma separated.

" Search
"========================================
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch

" Key remaps
"========================================
let mapleader=" "
nnoremap <leader>n :set nu!<CR>
nnoremap <leader>r :set rnu!<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
" Quick save
nnoremap <leader>w :w<CR>
" Toggle dark/light mode
nnoremap <leader>l :set background=light<CR>:colorscheme paper<CR>
nnoremap <leader>d :set background=dark<CR>:colorscheme gruvbox<CR>
" Vertical split
nnoremap <leader>s <C-w>v<C-w>l

" Set navigation to center cursor
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap j jzz
nnoremap k kzz
nnoremap <Up> kzz
nnoremap <Down> jzz
nnoremap <Left> h
nnoremap <Right> l

" Shortcuts for split navitation:
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <C-up> <C-w>+
nnoremap <C-down> <C-w>-
nnoremap <C-left> <C-w>>
nnoremap <C-right> <C-w><

" Unicode 
"------------------------------------------------
inoremap \mu μ
inoremap \ugmc μg/m³

" Space-Tab to find and replace <++> in insert
"------------------------------------------------
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l

" LaTeX
"------------------------------------------------
autocmd FileType tex inoremap ;em \textit{}<++><Esc>?\\{<Enter>a
autocmd FileType tex inoremap ;li \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space> 
autocmd FileType tex inoremap ;it <Enter>\item<Space>


" Vim-plug
"========================================
" Installing vim-plug:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/autoload')

Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'yorickpeterse/vim-paper'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'
"Plug 'itchyny/lightline.vim'

call plug#end()

" Plugins under consideration
"Plug 'junegunn/fzf.vim'
"Plug 'dmerejkowsky/vim-ale.vim'

"Install new plugins using
":source %
":PlugInstall

"Uninstall by deleting the line, and calling:
":PlugClean

"Plugin specific settings:
"------------------------------------------------
"F3 Nerdtree: Toggle nerdtree with F3
nnoremap <F3> :NERDTreeToggle<cr>

"F5 Compile LaTeX: Use vimtex to compile the TeX document. Still needs work.
nnoremap <F5> :VimtexCompile<cr>

"F11 Activate reading mode with F11
nnoremap <F11> :Goyo<cr>

"F12 Activate reading with focus mode with F12
nmap <F12> :Goyo <bar> Limelight!!<CR>"

" Lightline settings
"------------------------------------------------
"set laststatus=2
"set noshowmode
"let g:lightline = {
"      \ 'colorscheme': 'Tomorrow_Night',
"      \ }

" Gruvbox settings
"------------------------------------------------
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'light'
colorscheme gruvbox

"VimWiki settings.
"------------------------------------------------
" Set VimWiki to use markdown syntax:
" Specify path of any directories to use VimWiki
let g:vimwiki_list = [{'path': '~/Documents/VimWiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Status line
"========================================
"set statusline=
" Run <:so $VIMRUNTIME/syntax/hitest.vim> to view available colors to 
" enter into next line
set statusline+=%#StatusLineNC#
set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left and right side
set statusline+=%=
" Status line right side
set statusline+=\ %l/%L\ [%c]\ %p%%
" Show the status on the second to last line
set laststatus=2
