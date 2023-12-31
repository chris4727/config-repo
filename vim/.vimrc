"========================================
" .vimrc
" Requires vim-plug. Install with:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
set history=5000
set guifont=Fira\ Code\ Nerdfont:12

" Layout
"========================================
set shiftwidth=4
set tabstop=4
set autoindent

" Line wrapping
"========================================
" Set the character number where colorcolumn appears
set colorcolumn=80
" Change GUI colorcolumn to black.
highlight ColorColumn guibg=Black
" Changes terminal colorcolumn to black.
highlight ColorColumn ctermbg=0
" Wrap paragraph
"	To wrap line at end of wrap point, use `gqq'
"	To wrap paragraph at end of wrap point, use `gq}'
nnoremap <C-w> gq}

" Autocomplete:
"========================================
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.img,.xlsx

" Spellcheck
"========================================
set spelllang=en_us "Add new iso codes comma separated.
set spell
"TODO Set misspelled words to red and squiggly underline
hi clear SpellBad
" Toggle spell check.
nnoremap <F5> :setlocal spell!<CR>
inoremap <F5> <C-o>:setlocal spell!<CR>
" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#fb4934 
hi SpellLocal cterm=underline ctermfg=203 guifg=#fb4934
hi SpellRare cterm=underline ctermfg=203 guifg=#fb4934
hi SpellCap cterm=underline ctermfg=203 guifg=#fb4934

" Cursor
"========================================
" Use a line cursor in insert mode and a block cursor everywhere else.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).

" Abbreviations
"------------------------------------------------
"TODO Get this working to autocorrect 'teh' to 'the'
"iab teh the

" Search
"========================================
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
" Find next TODO (case insensitive)
nnoremap <leader>t <Esc>/todo<Enter>

" Leader
"========================================
let mapleader=" "
let maplocalleader=","

" Toggle line numbers
nnoremap <leader>n :set nu!<CR>
nnoremap <leader>r :set rnu!<CR>

" Toggle visually showing all whitespace characters.
nnoremap <F7> :set list!<CR>

" Variable $MYVIMRC is set by vim to the vimrc being used
" 	:echo $MYVIMRC
" Edit Vim config file in a split
map <Leader>ev :vsp $MYVIMRC<CR>
" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>
" Edit bash config file in a split
map <Leader>eb :vsp ~/.bashrc<CR>

" Clipboard
"------------------------------------------------
" Requires gvim for + and * registers for clipboard access.
" Yank selection into system clipboard (may need `+` instead of `*`)
vnoremap <C-c> "+y
" Yank into system clipboard (may need `+` instead of `*`)
inoremap <C-v> <C-r>+
" See :help clipboard. 
" You can :set clipboard=unnamed or :set clipboard=unnamedplus to make all yanking/deleting operations automatically copy to the system clipboard.
""set clipboard=unnamed

" Navigation
"------------------------------------------------
" Set navigation to center cursor
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap j jzz
nnoremap k kzz
nnoremap <Up> <Up>zz
nnoremap <Down> <Down>zz

" Colemak-DH remaps
"------------------------------------------------
"TODO Create a new vim command to toggle between qwerty and colemak-dh mappings. Ex. :Kbd!
"See: https://dev.to/dlains/create-your-own-vim-commands-415b
"TODO Alt: Create variables that can be easily set in the .vimrc
"See: https://learnvimscriptthehardway.stevelosh.com/chapters/19.html
"nnoremap j nzz
"nnoremap k ezz
"nnoremap h m
"nnoremap l i
"" Remap insert to 'h' as in 'insert [h]ere'
"nnoremap i h
"nnoremap I H
"" Remap next search result to 'l'
"nnoremap n l
"nnoremap N L
"" Remap other nav keys to avoid conflicts
"nnoremap e k
"nnoremap E K
"nnoremap m j
"nnoremap M J

" Split
"------------------------------------------------
" [V]ertical split
nnoremap <leader>v :vsp<CR>
nnoremap <leader>v :vsp<CR>
set splitbelow splitright
" Shortcuts for split navitation:
" TODO Look into fixing this for colemak-dh
" Navigate around splits with a single key combo.
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-up> <C-w>+
nnoremap <C-down> <C-w>-
nnoremap <C-left> <C-w>>
nnoremap <C-right> <C-w><

" Snippets
"===============================================
"TODO Move these to seperate ftplugin files
"See https://www.ejmastnak.com/tutorials/vim-latex/vimtex/#configuration`k:w

" Space-; to find and replace <++> in insert
"------------------------------------------------
inoremap <Space>; <Esc>/<++><Enter>"_c4l
vnoremap <Space>; <Esc>/<++><Enter>"_c4l
map <Space>; <Esc>/<++><Enter>"_c4l

" General
"------------------------------------------------
nnoremap ;( i()<++><Esc>4hi
nnoremap ;{ i{}<++><Esc>4hi
nnoremap ;[ i[]<++><Esc>4hi
nnoremap ;" i""<++><Esc>4hi
nnoremap ;' i''<++><Esc>4hi
"inoremap ;" “”<++><Esc>4hi
"inoremap ;' ‘’<++><Esc>4hi
nnoremap ;-- i–
nnoremap ;--- i—
nnoremap ;!! i¡
nnoremap ;?? i¿

" Accents and other characters
"------------------------------------------------
" List of unicode characters can be found here:
" https://en.wikipedia.org/wiki/List_of_Unicode_characters
nnoremap ;'a á
nnoremap ;'e é
nnoremap ;'o ó
nnoremap ;"i ï
nnoremap ;~n ñ

" Math
"------------------------------------------------
inoremap ;x ×
inoremap ;+- ±
inoremap ;^3 ³
inoremap ;_8 ₈
inoremap ;mu μ
inoremap ;ugmc μg/m³
inoremap ;^0 °
inoremap ;~~ ≈
inoremap ;<= ≤
inoremap ;>= ≥
inoremap ;/= ≠
" Insert date time
nnoremap ;dt :exe 'r!date --date="now" "+\%F<Space>\%T<Space>\%a"'<CR>

" Markdown
"------------------------------------------------
let g:markdown_fenced_languages = ['vim', 'tex', 'bash=sh']
let g:markdown_syntax_conceal = 0
" Insert date time heading
autocmd FileType markdown,vimwiki nnoremap ;dh :exe 'r!date --date="now" "+\%F<Space>\%T<Space>\%a"'<CR>I#<Space><Esc>$
" [h]eading 1
autocmd FileType markdown inoremap ;h1 <Esc>I#<Space><Esc>A
autocmd FileType markdown nnoremap ;h1 I#<Space><Esc>$ 
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
autocmd FileType markdown inoremap ;ul <Esc>I-<Space><Esc>A
autocmd FileType markdown nnoremap ;ul I-<Space><Esc>$ 
" [en]umerate 
autocmd FileType markdown inoremap ;ol <Esc>I1.<Space><Esc>A
autocmd FileType markdown nnoremap ;ol I1.<Space><Esc>$ 
" Create new checkbo[x]
autocmd FileType markdown inoremap ;x <Esc>I-<Space>[<Space>]<Space>
autocmd FileType markdown nnoremap ;x I-<Space>[<Space>]<Space><Esc>$ 
" Check existing checkbo[X]
autocmd FileType markdown inoremap ;X <Esc>0t]rx<Esc>A
autocmd FileType markdown nnoremap ;X 0t]rx<Esc>$ 
" Insert lin[k]. [description](url)
autocmd FileType markdown inoremap ;k [](<++>)<++><Esc>10hi
" Insert [w]iki link
autocmd FileType markdown inoremap ;w [[]]<++><Esc>5hi
" Insert [p]hotograph. ![description](path)
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
" [h]eading 1
autocmd FileType tex inoremap ;h <Esc>I\section{<Esc>A}
"autocmd FileType tex nnoremap ;h 
" [h]eading 2
autocmd FileType tex inoremap ;h2 <Esc>I\subsection{<Esc>A}
"autocmd FileType tex nnoremap ;h2 
" [h]eading 3
autocmd FileType tex inoremap ;h3 <Esc>I\subsubsection{<Esc>A}
"autocmd FileType tex nnoremap ;h3 
" Increase [H]eader level
autocmd FileType tex inoremap ;H <Esc>0asub<Esc>A
autocmd FileType tex nnoremap ;H 0asub<Esc>$ 
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
" [f]ootnote
autocmd FileType tex inoremap ;f \footnote{}<++><Esc>4hi

" [en]vironment
autocmd FileType tex inoremap ;en \begin{}<CR><++><CR>\end{<++>}<CR><++><Esc>3k$i
" [u]nordered [l]ist
autocmd FileType tex inoremap ;ul \begin{itemize}<CR><CR>\end{itemize}<CR><++><Esc>2kA\item
" [n]umbered [l]ist
autocmd FileType tex inoremap ;nl \begin{enumerate}<CR><CR>\end{enumerate}<CR><++><Esc>2kA\item<Space> 
" Add [i]tem
autocmd FileType tex inoremap ;it <CR>\item
" Insert [p]hotograph {path}
autocmd FileType tex inoremap ;p \includegraphics{}<++><Esc>4hi
" Insert lin[k]. {url}{description}
autocmd FileType tex inoremap ;k \href{}{<++>}<++><Esc>10hi


" Plugins: Vim-plug
"========================================

call plug#begin('~/.vim/autoload')

"Asthetic
Plug 'gruvbox-community/gruvbox'
Plug 'ap/vim-css-color'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
"Version control
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
"TODO Allows diffs of directories
Plug 'will133/vim-dirdiff'
Plug 'AndrewRadev/linediff.vim'
"Languages
Plug 'tbastos/vim-lua'
"TODO Add/configure the following plugins 
"Plug 'junegunn/fzf.vim'
"Plug 'tpope/vim-commentary'

call plug#end()

"Install new plugins using
":source %
":PlugInstall

"Uninstall by deleting the line, and calling:
":PlugClean

"Plugin specific settings:
"------------------------------------------------
"Nerdtree: Toggle nerdtree
nnoremap <leader>f :NERDTreeToggle<cr>

" VimTeX
"------------------------------------------------
"	see ":help vimtex".
" VimTeX uses latexmk as the default compiler backend
" 	see ":help vimtex-compiler".

let g:vimtex_view_method = 'zathura'

" Goyo
"------------------------------------------------
"F11 Activate reading mode with F11
nnoremap <F11> :Goyo<CR>

"F12 Activate reading with focus mode with F12
nmap <F12> :Goyo <bar> Limelight!!<CR>"

"VimWiki
"------------------------------------------------
" Set VimWiki to use markdown syntax:
" Specify path of any directories to use VimWiki
"TODO Create seperate Wiki for personal notes and public reference notes.
let g:vimwiki_list = [{'path': '~/Wiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Colorscheme settings
"------------------------------------------------
set termguicolors
let g:gruvbox_contrast_dark = 'light'
set background=dark
colorscheme gruvbox
" Toggle dark/light mode
nnoremap <leader>l :colorscheme catppuccin_latte<CR>:set background=light<CR>
nnoremap <leader>d :set background=dark<CR>:colorscheme gruvbox<CR>

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
