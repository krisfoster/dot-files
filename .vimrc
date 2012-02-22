" Basics {
    set nocompatible               " Use vim not vi compat mode
    set noexrc                     " ???
    set background=light           " Use a light background
    set cpoptions=aABceFsmq        " Editing options
    syntax on                      " Use syntax highlighting
" }
" General {
    filetype plugin indent on      " Load filetype / indent plugins
    set backspace=indent,eol,start " Makes backspace more flexible
    set backup                     " Make backup files
    "set backupdir=.vim/backup
    set clipboard+=unnamed         " Share windows clipboard
    "set directory=.vim/tmp         
    set fileformats=unix,mac,dos
    set hidden                     " You can change buffers without saving
    set mouse=a                    " Use the mouse everywhere
    set noerrorbells               " No error / warning sounds
    set whichwrap+=b,s,<,>,[,]     " Movement wrapping
    set wildmenu                   " Use wildmenu
    set wildignore=.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
    set wildmode=list:longest
" }
" Vim UI {
    :colorscheme ron               " Sets the colour scheme to something readable
    set cursorcolumn               " Highlight the current column
    set cursorline                 " Highlight the current line
    set incsearch                  " Highlight natching text as searching
    set laststatus=2               " Always show the status line
    set lazyredraw                 " Do NOT redraw whilst running macros
    set linespace=0                " Do not insert extra pixels between lines
    set list                       " Show tabs and trailing spaces
    set listchars=tab:>-,trail:-
    set nostartofline              " Leave cursor where it is
    set number                     " Turn on line numbering
    set numberwidth=5
    set report=0
    set ruler                      " Always show current pos in bottom right
    set scrolloff=10
    set showcmd
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
" }
" Test Formatting / Layout {
    "set completeopt
    set expandtab                  " No real tabs - convert to spaces
    set formatoptions=rq           " 
    set ignorecase                 " Case insensitivity
    set infercase
    set nowrap
    set shiftround
    set smartcase
    set shiftwidth=4
    set softtabstop=4
    set tabstop=8
" }
" Folding {
    set foldenable
    set foldmarker={,}
    set foldmethod=marker
    "set foldmethod=syntax
    set foldlevel=100
    set foldopen=block,hor,mark,percent,quickfix,tag
    function SimpleFoldText() " {
            return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText()
" }
" Plugin Settigs {
    " Ctags {
        let Tkist_Auto_open=0
        let Tlist_Compact_Format=1
        let Tlist_Ctags_Cmd = "ctags"
        let Tlist_Enable_Fold_Column=0
        let Tlist_Exist_OnlyWindow=1
        map <F5> :TlistToggle<CR>
        map <F6> :!ctags -R --language-force=idoc --c++-kinds=+p --fields=+S --extra=+f .<CR>
    " }
" }
" VIMClojure {
    let vimclojure#HighlightBuiltins = 1
    let vimclojure#ParenRainbow = 1
    let vimclojure#WantNailgun = 1
    " Tagslist config for the taglist plugin to get it to work with clojure
    let tlist_clojure_settings = 'Lisp;f:function'
" }
" Mappings {
    noremap <s-space> <C-b>        " Scroll back using shift space
    noremap <space> <C-f>          " Scroll forward using space
    noremap ø :wincmd f<CR>        " Open filename under cursor
" }
" Templates {
    function! LoadTemplate(extension)
        silent! :execute '0r $VIMHOME/templates/'.a:extension. '.tpl'
    endfunction

    function! LoadPatterns(extension)
        silent! :execute 'source $VIMHOME/templates/'.a:extension.'.patterns.tpl'
    endfunction

    " When opneing a new file or buffer try and create it from a template
    " based on the extension of the new file.
    " The templates are to be put in $VIMHOME/templates
    :au BufNewFile * silent! call LoadTemplate('%:e')
    :au BufRead    * silent! call LoadPatterns('%:e')
    " Take you to the next token in normal and insert mode by hitting ctrl-j
    nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
    inoremap <c-j> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>
    " High-light the tokesn
    match Todo /<+.\++>/
" }
