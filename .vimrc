" Author: chxuan <787280310@qq.com>;  wangtao

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>" " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18 " 设置字体
    else
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 18      " 设置字体
    endif
    set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0           " 隐藏Tab栏
    set guicursor=n-v-c:ver5    " 设置光标为竖线
endif

" load vim default plugin
runtime macros/matchit.vim

" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>vc :edit ~/.vimrc.custom.config<cr>
nnoremap <leader>vp :edit ~/.vimrc.custom.plugins<cr>

" 查看vimplus的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimplus/help.md<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" 主题设置
set background=dark
let g:onedark_termcolors=256
colorscheme onedark

" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
" tagbar
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>

" incsearch.vim
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

" LeaderF
nnoremap <leader>f :LeaderfFile .<cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

" echodoc.vim
let g:echodoc_enable_at_startup = 1

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

"vim-commentary
"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s
"gcc     注释当前行（普通模式）
"gc      可视模式下，注释当前选中的部分
"gcu     撤销上一次注释的部分，可以是一行也可以是多行
"gcgc    撤销注释当前行和邻近的上下两行

" 加载自定义配置
if filereadable(expand($HOME . '/.vimrc.custom.config'))
    source $HOME/.vimrc.custom.config
endif


