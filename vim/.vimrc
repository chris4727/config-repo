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
set spelllang=en_us "Add new iso codes comma separated.
set spell
hi clear SpellBad
hi SpellBad cterm=underline

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
nnoremap <F5> :source ~/.vimrc<CR>
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



" Snippets
"===============================================

" Space-Tab to find and replace <++> in insert
"------------------------------------------------
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l

" General
"------------------------------------------------
inoremap ;( ()<++><Esc>4hi
inoremap ;{ {}<++><Esc>4hi
inoremap ;[ []<++><Esc>4hi
inoremap ;" “”<++><Esc>4hi
inoremap ;' ‘’<++><Esc>4hi
inoremap ;mu μ
inoremap ;ugmc μg/m³

" Markdown
"------------------------------------------------
" [h]eading 1
autocmd FileType markdown inoremap ;h <Esc>I#<Space><Esc>A
autocmd FileType markdown nnoremap ;h I#<Space><Esc>$ 
" [h]eading 2
autocmd FileType markdown inoremap ;h2 <Esc>I##<Space><Esc>A
autocmd FileType markdown nnoremap ;h2 I##<Space><Esc>$ 
" [h]eading 3
autocmd FileType markdown inoremap ;h3 <Esc>I###<Space><Esc>A
autocmd FileType markdown nnoremap ;h3 I###<Space><Esc>$ 
" Increase [H]eader level
autocmd FileType markdown inoremap ;H <Esc>I#<Esc>A
autocmd FileType markdown nnoremap ;H I#<Esc>$ 
" [b]old
autocmd FileType markdown inoremap ;b  ****<++><Esc>5hi
autocmd FileType markdown nnoremap ;b  bi**<Esc>ea**<Esc>
" [i]talic
autocmd FileType markdown inoremap ;i  **<++><Esc>4hi
autocmd FileType markdown nnoremap ;i  bi*<Esc>ea*<Esc>
" [c]ode
autocmd FileType markdown inoremap ;c  ``<++><Esc>4hi
autocmd FileType markdown nnoremap ;c  bi`<Esc>ea`<Esc>
" [c]ode [b]lock
autocmd FileType markdown inoremap ;cb  ```<CR><++><CR>```<CR><++><Esc>3kA
autocmd FileType markdown nnoremap ;cb  O```<Esc>}i```<Esc>{j$
" [it]emize 
autocmd FileType markdown inoremap ;it <Esc>I-<Space><Esc>A
autocmd FileType markdown nnoremap ;it I-<Space><Esc>$ 
" [en]umerate 
autocmd FileType markdown inoremap ;en <Esc>I1.<Space><Esc>A
autocmd FileType markdown nnoremap ;en I1.<Space><Esc>$ 
" Create new checkbo[x]
autocmd FileType markdown inoremap ;x <Esc>I-<Space>[<Space>]<Space>
autocmd FileType markdown nnoremap ;x I-<Space>[<Space>]<Space><Esc>$ 
" Check existing checkbo[X]
autocmd FileType markdown inoremap ;X <Esc>0t]rx<Esc>A
autocmd FileType markdown nnoremap ;X 0t]rx<Esc>$ 
" Insert lin[k]
autocmd FileType markdown inoremap ;k [](<++>)<++><Esc>10hi
" Insert [w]iki link
autocmd FileType markdown inoremap ;w [[]]<++><Esc>5hi
" Insert [p]hotograph
autocmd FileType markdown inoremap ;p ![](<++>)<++><Esc>10hi
" Insert [f]ootnote. Go back with 2<C-o>. Search footnotes /\[^.*]
autocmd FileType markdown inoremap ;f [^]<Esc>Go[^<++>]:<Space><++><Esc>``i
" Insert [Y]AML frontmatter
autocmd FileType markdown nnoremap ;y ggO---<CR>title:<Space>"<++>"<CR>author:<Space>"Chris<Space>Pyke"<CR>---<CR><CR>#<Space><++><Esc>gg
" TODO Add date using :pu=strftime('%Y-%m-%d')
" TODO Add table.

" LaTeX
"------------------------------------------------
" [m]acro
autocmd FileType tex inoremap ;m \{<++>}<++><Esc>9hi
" [i]talic
autocmd FileType tex inoremap ;i \textit{}<++><Esc>4hi
autocmd FileType tex nnoremap ;i  bi\textit{<Esc>ea}
" [b]old face
autocmd FileType tex inoremap ;b \textit{}<++><Esc>4hi
" [s]mall caps
autocmd FileType tex inoremap ;s \textsc{}<++><Esc>4hi
" Double quotes
autocmd FileType tex inoremap ;'' ``''<++><Esc>5hi
" Single quotes
autocmd FileType tex inoremap ;' `'<++><Esc>4hi
" Inline math
autocmd FileType tex inoremap ;mm $$<++><Esc>4hi
" Display math
autocmd FileType tex inoremap ;dm \[<Space><Space>\]<++><Esc>6hi
" [c]ite
autocmd FileType tex inoremap ;c \cite{}<++><Esc>4hi

" [it]emize environmet
autocmd FileType tex inoremap ;it \begin{itemize}<CR><CR>\end{itemize}<CR><++><Esc>2kA\item
" [e]numerate environmnet
autocmd FileType tex inoremap ;en \begin{enumerate}<CR><CR>\end{enumerate}<CR><++><Esc>2kA\item<Space> 
" Add [i]tem
autocmd FileType tex inoremap ;ii <CR>\item


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
Plug 'airblade/vim-gitgutter'
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

"F4 Compile LaTeX: Use vimtex to compile the TeX document
" TODO Get vim compiling working. Setup without vimtex?
"nnoremap <F4> :VimtexCompile<cr>

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
