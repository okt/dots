"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Plugins
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set omnifunc=ale#completion#OmniFunc
  let g:ale_completion_enabled = 1
  let g:ale_completion_autoimport = 1
  let g:ale_sign_column_always = 1
  let g:ale_fix_on_save = 1
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = ''
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['eslint'],
  \   'typescript': ['eslint','tslint', 'xo'],
  \   'css': ['stylelint', 'fecs'],
  \   'rust': ['rustfmt', 'rls'],
  \}
  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" : "\<TAB>"

  let g:user_emmet_leader_key='<C-/>'

  let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ ,
      \   'right': [ [ 'lineinfo' ],
      \              ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
  \ }
  let g:lightline#ale#indicator_checking = "\uf110"
  let g:lightline#ale#indicator_infos = "\uf129"
  let g:lightline#ale#indicator_warnings = "\uf071"
  let g:lightline#ale#indicator_errors = "\uf05e"
  let g:lightline#ale#indicator_ok = "\uf00c"
  let g:lightline.separator = {
      \   'left': '', 'right': ''
  \}
  let g:lightline.subseparator = {
      \   'left': '', 'right': ''
  \}
  function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
  endfunction

  let g:fzf_layout = { 'down': '~10%' }


  call plug#begin('~/.local/share/nvim/plugged')
      Plug 'sheerun/vim-polyglot'
      Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}
      "Plug 'glepnir/dashboard-nvim'
      Plug 'mhinz/vim-startify'
      Plug 'kyazdani42/nvim-web-devicons'
      Plug 'romgrk/barbar.nvim'
      Plug 'morhetz/gruvbox'
      Plug 'cespare/vim-toml'
      Plug 'jiangmiao/auto-pairs'
      Plug 'mattn/emmet-vim'
      Plug 'dense-analysis/ale'
      Plug 'itchyny/lightline.vim'
      Plug 'maximbaz/lightline-ale'
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf.vim'
  call plug#end()

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => General
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set hidden
  set history=500
  filetype plugin indent on
  set autoread
  set laststatus=2
  set noshowmode
  au FocusGained,BufEnter * checktime

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => VIM user interface
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set so=18
  set number relativenumber
  set wildmenu
  set ruler
  set cmdheight=1
  set hid
  set backspace=eol,start,indent
  set whichwrap+=<,>,h,l
  set ignorecase
  set smartcase
  set hlsearch
  set incsearch
  set lazyredraw
  set magic
  set showmatch
  set mat=1

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Colors and Fonts
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:daycula_transparent_background = 1

  syntax enable
  " set termguicolors
  set background=dark
  colorscheme gruvbox
  " colorscheme daycula
  set encoding=utf8
  set ffs=unix,dos,mac
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Files, backups and undo
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set nobackup
  set nowb
  set noswapfile

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Text, tab and indent related
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set expandtab
  set smarttab
  set shiftwidth=4
  set tabstop=4
  set lbr
  set tw=500
  set ai
  set si
  set wrap

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Moving around, tabs, windows and buffers
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:mapleader="\<Space>"
  nmap <Leader>ss :<C-u>SessionSave<CR>
  nmap <Leader>sl :<C-u>SessionLoad<CR>

  let mapleader = " "

  nmap <leader><CR> :FZF<CR>
  nmap <silent> <leader><leader> :w!<CR>
  nmap <silent> <F11> <Plug>(ale_previous_wrap)
  nmap <silent> <F23> <Plug>(ale_next_wrap)
  nmap <silent> <F12> :ALEGoToDefinition<CR>
  nmap <silent> <F24> :ALEFindReferences<CR>

  map <leader>s :Ag<space>
  map <silent> <leader><ESC> :noh<CR>
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l

  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


  " Magic buffer-picking mode
noremap <silent> <C-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
