"Vundle 设置必须
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle包管理 start
"" defalut
Plugin 'gmarik/Vundle.vim'
" 颜色主题包
Plugin 'flazz/vim-colorschemes'


" Vundle包管理 end
call vundle#end()            " required
filetype plugin indent on    " required

"语法开关
syntax on
"自动存档
"set autowrite
"不让vim 发出讨厌的滴滴声
set noerrorbells
" 设置行号
set nonumber

" 打开状态栏标尺
set ruler
" 设置折叠方式
set foldmethod=manual
"设置编码
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac
"自动缩进
set smarttab
"搜索忽略大小写
set ignorecase
"设置tab长度
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
"设置主题,参考网站http://vimcolorschemetest.googlecode.com/svn/html/index-html.html
set t_Co=256
colorscheme  badwolf
" 唤醒JS标记
"au FileType javascript call JavaScriptFold()
"禁止生成临时文件
set nobackup
set noswapfile

" 显示indent
set list
set listchars=tab:┊\

"显示搜索内容
set hlsearch
"输入搜索内容时就显示搜索结果
set incsearch
"" autocmd
" 垂直线
set cursorcolumn
" 设置Ctrl+P 为粘贴
"set pastetoggle=<c-p>
set pastetoggle=<F2>
" 开启本地记录
"backup
set undodir=~/.vim/tmp/undo//
set undofile
set history=100
set undolevels=100

