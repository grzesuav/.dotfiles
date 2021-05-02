if &compatible
  set nocompatible
endif
filetype off
" append to runtime path
set rtp+=/usr/share/vim/vimfiles
" initialize dein, plugins are installed to this directory
call dein#begin(expand('~/.cache/dein'))
" add packages here, e.g:
call dein#add('qwelyt/TrippingRobot')
call dein#add('vim-ctrlspace/vim-ctrlspace')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('majutsushi/tagbar')
call dein#add('junegunn/fzf.vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-surround')
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('dense-analysis/ale')
" exit dein
call dein#end()
" auto-install missing packages on startup
if dein#check_install()
  call dein#install()
endif
filetype plugin on
syntax on
filetype indent on
set number
" for ctrl-space
set nocompatible
set hidden
" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'angr'
" mappings
nmap <F8> :TagbarToggle<CR>
nmap <F9> ::NERDTreeToggle<CR>
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
