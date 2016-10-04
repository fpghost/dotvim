set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The bundles you install listed here
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab.git'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Highlight excess line length 
"Stop too long lines in Python
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%160v.*/
    autocmd FileType python set nowrap
    augroup END

" Powerline setup
" Display mode, git branch +more
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
"
" (optional) use on dark background
set background=dark

" I prefer spaces to tabs
" http://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

"Nerdtree, filebrowser
map <Leader>t :NERDTreeToggle<CR>

"Supertab (tab completion) to complement
"jedi
let g:SuperTabDefaultCompletionType = "context"

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"Use Jedi instead of rope for autocomp
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
" Auto check on save
let g:pymode_lint_checkers = ["pep8","pyflakes"]
let g:pymode_lint_write = 1
" don't warn me about the long lines, which would just clog up error space
let g:pymode_lint_ignore = "E501,W503,E402"
" The big red vertical warning bar
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" autofold code (1 or 0)
" use zo/zc to open/close folds
let g:pymode_folding = 1

" Quicker save \s
" nb shift zz too
noremap <Leader>s :update<CR>

"Easier split nav
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" quicker jump to normal mode(nb ctrl c works too)
inoremap kj <Esc>

" Toggle paste mode
set pastetoggle=<Leader>p

" Disable arrow keys to train me to use hjkl
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>

".vimrc (jb js beautify, hb html beautify, cb css beautify)(but these will
"only define these commands if filetype matches.....I want all commands when
"file is html for mix of html/js/css)
"autocmd FileType javascript vnoremap <buffer>  <Leader>jb :call RangeJsBeautify()<cr>
"autocmd FileType html vnoremap <buffer> <Leader>hb :call RangeHtmlBeautify()<cr>
"autocmd FileType css vnoremap <buffer> <Leader>cb :call RangeCSSBeautify()<cr>
" To use these visually select area of interest and then type e.g. :Rjb or
" :Rhb or :Rhc depending if js, html or css. Be careful when django is mixed
" with js inline...it doesnt work well. For html you can also just (assuming
" :filetype indent on, :set smartindent) visually select then press '=' to
" tidy
:command -range Rjb <line1>,<line2>call RangeJsBeautify()
:command -range Rhb <line1>,<line2>call RangeHtmlBeautify()
:command -range Rcb <line1>,<line2>call RangeCSSBeautify()
