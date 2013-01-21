" 禁止vim以兼容vi的模式运行
set nocompatible

"--------------------------------------------------
" CFG_Path: 路径配置{{{1
"--------------------------------------------------

"判断当前系统
function! MySys()
    if has("win32") || has("win64")
        return "windows"
    elseif has("unix")
        return "unix"
    endif
endfunction

" 设置vim配置文件路径
if MySys()=="windows"
    let $VIM_CFG_PATH=$VIM
else
    let $VIM_CFG_PATH=$HOME.'/.vim'
endif

" 载入本地配置文件
if filereadable($VIM_CFG_PATH.'/local_config.vim')
    source $VIM_CFG_PATH/_vimrc_local.vim
endif

" 设置PATH
if MySys()=="windows"
    let $PATH=$PATH.';'.$VIM.'\bin'
else
    let $PATH=$PATH.':'.$HOME.'/.vim/bin'
endif

"--------------------------------------------------
" CFG_Plugin: 插件管理{{{1
"--------------------------------------------------

" 关闭文件类型检测
filetype off

" 启用vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"--------------- vim-scripts 的仓库 ---------------"
"Bundle 'PinyinSearch'
"Bundle 'VimRepress'
"Bundle 'utl.vim'
Bundle 'EasyMotion'
Bundle 'FuzzyFinder'
Bundle 'Gundo'
Bundle 'JavaScript-Indent'
Bundle 'L9'
Bundle 'Mark'
Bundle 'PasteBin.vim'
Bundle 'VisIncr'
Bundle 'ack.vim'
Bundle 'gtk-vim-syntax'
Bundle 'jQuery'
Bundle 'matchit.zip'
Bundle 'VimIM'

"------------- github其他用户的仓库 -------------"
"Bundle 'Shougo/neocomplcache'
"Bundle 'chrisbra/csv.vim
"Bundle 'jiazhoulvke/Pydiction'
"Bundle 'majutsushi/tagbar'
"Bundle 'mattn/calendar-vim'
"Bundle 'mattn/googlereader-vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'rson/vim-conque'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'asins/vimcdoc'
Bundle 'guns/ultisnips'
Bundle 'jiazhoulvke/googletranslate'
Bundle 'jiazhoulvke/imagemap'
Bundle 'jiazhoulvke/jianfan'
Bundle 'jiazhoulvke/myproject'
Bundle 'jiazhoulvke/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-lua-ftplugin'

"------------- 非github的仓库 -------------"
" 暂无

"--------------------------------------------
" CFG_Base: 基本设置{{{1
"--------------------------------------------

" 启用插件、插件及文件类型检测
filetype plugin indent on

" 语法高亮
syntax on

" 设置vim内部编码
set encoding=utf-8

" 设置文件编码集 :help encoding-values
set fileencodings=ucs-bom,utf-8,chinese,gbk,gb18030,taiwan,japan,korea,latin-1

" 设置文件编码
set fileencoding=utf-8

" 设置控制台编码
if MySys()=="windows"
    set termencoding=gbk
else
    set termencoding=utf-8
endif

" 解决控制台输出乱码
language messages zh_CN.utf-8

" 解决菜单乱码
if has("gui_running")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" 对不明宽度字符的处理方式
set ambiwidth=double

" 设置字体
if MySys()=="windows"
    set guifont=YaHei\ Consolas\ Hybrid:h12
else
    set guifont=DejaVu\ Sans\ Mono\ 12
    set guifontwide=文泉驿等宽微米黑\ 12
endif

" 输入法设置
"set imdisable=0

" 设置输入法热键
"set imactivatekey=C-space

" 设置文件换行符模式
set fileformat=unix

"设置背景颜色类型
set background=dark

"设置背景颜色
if MySys()=="windows"
    set t_Co=16
else
    set t_Co=256
endif

" 语法高亮的同步行数
"let g:vimsyn_minlines=500
"let g:vimsyn_maxlines=5000

" 配色方案
if has("gui_running")
    colo solarized
else
    colo desert
endif

" 解决一行代码过长就容易看不到的现象
set display=lastline

" 去掉菜单栏
set guioptions-=m

" 去掉工具栏
set guioptions-=T

" 去掉右边的滚动条
set guioptions-=r

" 去掉左边的滚动条
set guioptions-=L

" 设置状态栏显示方式
set laststatus=2
" 显示时间
"set statusline=%F\ [CWD=%{getcwd()}][%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][%Y]\%h%m%r%=[ASCII=\%03.3b]\ %LL\ %l,%c%V\ %P\ %{strftime(\"%Y-%m-%d\ %H:%M:%S\")}
" 不显示时间
set statusline=%F\ [CWD=%{getcwd()}][%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][%Y]\%h%m%r%=[ASCII=\%03.3b]\ %LL\ %l,%c%V\ %P

" 显示行号
set nu

" 打开状态栏标尺
set ruler

" 在屏幕最后一行显示当前输入的命令
set showcmd

" 高亮显示被找到的文本
set hls

" 运行宏时不重绘屏幕
set lz

" 禁用错误提示
set noerrorbells
set novisualbell
set t_vb=

" 高亮当前行
"set cursorline

" 高亮当前列
"set cursorcolumn

" 设置彩色列
"set cc=80

" 字符之间插入像素
set linespace=0

" 启用鼠标
if has('mouse')
    set mouse=a
endif

" 不用alt键访问菜单
set winaltkeys=no

" 禁用断行
set nolinebreak

" 设置行宽
"set textwidth=0

" 设定自动读取文件
set autoread

" 允许在当前buffer未保存时直接切换
set hidden

" 不使用交换文件
set noswapfile

" 设定文件浏览器目录为buffer当前目录
set bsdir=buffer

" 搜索时不区分大小写
set ignorecase

" 搜索时未完全输入完毕就开始检索
set is

" magic搜索模式
set magic

" 文件补全时忽略的符号
set isfname-==

" 设置持久性撤销目录
if v:version > 702
    if MySys()=="windows"
        set undodir=$TEMP
    else
        set undodir=/tmp
    endif
endif

" 启用持久性撤销
if v:version > 702
    set undofile
endif

" session保存的选项
set sessionoptions=curdir,winpos,resize,buffers,winsize

" 使用退格键删除字符
set backspace=indent,eol,start

" 允许按左右、退格等键移动到上下两行
set whichwrap=b,s,<,>,[,]

" 不自动换行
"set nowrap

" 自动缩进的尺寸为4个空格
set sw=4

" TAB宽度为4个字符
set ts=4

" TAB替换为空格
set et

"显示特殊字符
"set list
"set listchars=tab:\ \ ,trail:-
"set listchars=tab:»\
"set listchars=tab:»\ ,eol:\

" 智能tab
set smarttab

" 关闭自动备份
set nobackup

" 不在单词中间断行
"set lbr

" 打开断行模块对亚洲语言支持
"set fo+=mB

" 显示括号配对情况
set sm

" 打开C/C++风格的自动缩进
set cin

" 打开普通文件自动缩进
set ai

" 智能缩进
set si

" 历史操作列表条数
set history=512

" 设置折叠
"set foldcolumn=2
"set foldmethod=syntax
"set foldlevel=3

" 补全方式
set completeopt=menu
"set complete-=u
"set complete-=i

" 自动补全的方式
set wildmode=list:full
set wildmenu

" 设置make程序
set makeprg=make

" 设置编译器
compiler gcc

" php帮助手册
if MySys()=="windows"
    let &runtimepath=&runtimepath . ',' . expand("$VIM") . '\vim-php-manual'
    au filetype php let &tags=&tags . ',' . expand("$VIM") . '\vim-php-manual\doc\phptags'
else
    let &runtimepath=&runtimepath . ',' . expand("$HOME") . '/.vim/vim-php-manual'
    au filetype php set tags+=~/.vim/vim-php-manual/doc/phptags
endif
au filetype php set keywordprg=:help

" 在保存文件时自动去除无效空白，包括行尾空白和文件最后的空行
" From: Vigil
" See: http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
"autocmd BufWritePre * call RemoveTrailingWhitespace()

"--------------------------------------------
" CFG_BindKey:  按键绑定{{{1
"--------------------------------------------

" 设置leader为,
let mapleader=","

" 默认隐藏菜单栏和工具栏及右侧滚动条，可以通过 <F2> 切换显示和隐藏。
" URL: http://liyanrui.is-programmer.com/articles/1791/gvim-menu-and-toolbar-toggle.html
map <silent><F2> :if &guioptions =~# 'm' <Bar>
            \set guioptions-=m <bar>
            \set guioptions-=r <bar>
            \else <Bar>
            \set guioptions+=m <bar>
            \set guioptions+=r <bar>
            \endif<CR>

" 使用 windows Explorer 打开当前文件所在文件夹，并选中当前文件(仅windows有效)
if MySys()=="windows"
    nmap <leader>sf :exe '!start explorer /e,/select,' . iconv(expand("%:p"),"utf-8","gb2312")<CR>
endif

" ctags设置 (需要先安装ctags http://ctags.sourceforge.net)
map <leader>tag <ESC>:!ctags -R .<CR>
map <C-n> :tnext<CR>
map <C-p> :tprevious<CR>

" 打开quickfix窗口
nmap <silent><F7> <ESC>:cw<CR>

"映射j、k为每次移动相对屏幕的一行
nmap j gj
nmap k gk

" 映射Alt+j/k/h/l为方向键
map <M-j> <Down>
map <M-k> <Up>
map <M-h> <Left>
map <M-l> <Right>

" 命令行模式下的移动
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <M-f> <C-Right>
cmap <M-b> <C-Left>

" 重新载入vimrc配置
map <leader>rr <ESC>:so $MYVIMRC<CR>

" 打开vimrc
map <leader>ee <ESC>:e $MYVIMRC<CR>

" Ctrl-S保存
map <C-s> <ESC>:update<CR>
imap <C-s> <ESC>:update<CR>

" CTRL-D全选
"nmap <C-D> gggH<C-O>G
"imap <C-D> <C-O>gg<C-O>gH<C-O>G
"omap <C-D> <C-C>gggH<C-O>G
"smap <C-D> <C-C>gggH<C-O>G
"xmap <C-D> <C-C>ggVG

" CTRL-X剪切
vmap <C-X> "+x

" Ctrl+C复制
vmap <C-C> "+y

" CTRL-V粘贴
map <C-V> "+gp
imap <C-V> <C-O>"+gp
cmap <C-V> <C-R>+

" 由于C-V用作粘贴，所以用vv做列选择模式
nmap vv <C-Q>

" 普通模式下复制文件路径
nmap <C-C> :let @+=expand('%:p')<CR>

" Linux常用剪贴复制粘贴快捷键
vmap <S-Del> "+x
vmap <C-Insert> "+y
map <S-Insert> "+gP
cmap <S-Insert> <C-R>+

" leader-AX 全选并剪切
map <leader>ax <ESC>ggVG "+x

" leader-AC 全选并复制
map <leader>ac <ESC>:0,$yank +<CR>

" leader-AV 全选并覆盖粘贴
map <leader>av <ESC>ggVG "+gP

" 插入模式下上开一行
imap <C-CR> <ESC>O

" 插入模式下CTRL+d删除后面的字符
imap <C-d> <del>

" 插入模式下以emacs的方式移动光标
imap <C-a> <home>
imap <C-e> <end>

" 空格键向下翻页,Shift+空格向上翻页
nmap <space> <C-f>
nmap <S-space> <C-b>

" 使用Tab缩进
nmap <Tab> v>
nmap <S-Tab> v<

" 用CTRL+方向键调整窗口大小
nmap <C-up> <C-w>+
nmap <C-down> <C-w>-
nmap <C-left> <C-w><
nmap <C-right> <C-w>>

" Alt+h/j/k/l切换窗口
nmap <M-s> <C-W>j
nmap <M-w> <C-W>k
nmap <M-a> <C-W>h
nmap <M-d> <C-W>l

" 设置编码语言
nmap <leader>lhtm :set syn=xhtml  <Bar> set filetype=xhtml<CR>
nmap <leader>lasp :set syn=aspvbs <Bar> set filetype=asp<CR>
nmap <leader>lphp :set syn=php    <Bar> set filetype=php<CR>
nmap <leader>lvim :set syn=vim    <Bar> set filetype=vim<CR>
nmap <leader>lc   :set syn=c      <Bar> set filetype=c<CR>
nmap <leader>lsql :set syn=sql    <Bar> set filetype=sql<CR>
nmap <leader>lpy  :set syn=python <Bar> set filetype=python<CR>

" 转换文件编码
nmap <leader>gbk <ESC>:set fileencoding=gbk<CR>
nmap <leader>utf8 <ESC>:set fileencoding=utf8<CR>

" 在选中文本两边插入括号、双引号等
vmap <leader>( <ESC>`>a)<ESC>`<i(<ESC>
vmap <leader>[ <ESC>`>a]<ESC>`<i[<ESC>
vmap <leader>{ <ESC>`>a}<ESC>`<i{<ESC>
vmap <leader>" <ESC>`>a"<ESC>`<i"<ESC>
vmap <leader>' <ESC>`>a'<ESC>`<i'<ESC>
vmap <leader>< <ESC>`>a><ESC>`<i<<ESC>
vmap <leader>` <ESC>`>a`<ESC>`<i`<ESC>
vmap <leader>hc <ESC>`>a--><ESC>`<i<!--<ESC>
vmap <leader>cc <ESC>`>a*/<ESC>`<i/*<ESC>
vmap <leader><Space> <ESC>`>a<Space><ESC>`<i<Space><ESC>

" 替换\为/
vmap <leader>s\ :s/\\/\//g<CR>:noh<CR>
" 替换/为\
vmap <leader>s/ :s/\//\\/g<CR>:noh<CR>

" 一键运行单个文件
map <F5> <ESC>:w<CR>:call RunOneFile()<CR>
function! RunOneFile()
    if &filetype=='vim'
        source %
    elseif &filetype=='python'
        !python %
    elseif &filetype=='go'
        !go run %
    elseif &filetype=='c'
        if exists('g:ccprg')
            let b:ccprg = g:ccprg
        else
            let b:ccprg = 'gcc'
        endif
        if MySys()=="windows"
            exe '!' . b:ccprg . ' "' . expand('%:p') . '" -o "' . expand('%:p:r') . '.exe"'
            exe '!' . expand('%:p:r') . '.exe'
        else
            exe '!' . b:ccprg . ' "' . expand('%:p') . '" -o "' . expand('%:p:r') . '"'
            exe '!' . expand('%:p:r')
        endif
    elseif &filetype=='html' || &filetype=='xhtml'
        if MySys()=="windows"
            exe '!start explorer.exe "' . iconv(expand('%:p'),"utf-8","gb2312") . '"'
        else
            if executable('chromium')
                exe '!chromium "' . expand('%:p') . '"'
            elseif executable('firefox')
                exe '!firefox "' . expand('%:p') . '"'
            endif
        endif
    elseif &filetype=='sh' && executable(expand('%:p'))
        exe '!sh "' . expand('%:p') . '"'
    elseif &filetype=='dosbatch'
        exe '!cmd /c "' . iconv(expand("%:p"),"utf-8","gb2312") . '"'
    endif
endfunction

" 进入当前buffer所在的目录
map <leader>cd :cd %:p:h<cr>

" 取消搜索高亮
nmap <leader>nh :noh<CR>

" 删除^M
noremap <Leader>dm mmHmn:%s/<C-V><cr>//ge<cr>'nzt'm

" 删除空行
noremap <Leader>dbl :g/^\s*$/d<CR>

" 从剪贴板上过滤非可打印字符
nmap <leader>p :let @* = substitute(@*,'[^[:print:]]','','g')<cr>"*p

" 折叠html代码
function! HtmlFold()
    syn region myHtmlFold start="<html"         end="/html>"            transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn region myHtmlFold start="<head"         end="/head>"            transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn region myHtmlFold start="<body"         end="/body>"            transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn region myHtmlFold start="<div"          end="/div>"             transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn region myHtmlFold start="<script"       end="/script>"          transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn region myHtmlFold start="<style"        end="/style>"           transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn region myHtmlFold start="<object"       end="/object>"          transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn region myHtmlFold start="<!--"          end="-->"               transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn region myHtmlFold start="{"             end="}"                 transparent fold keepend extend containedin=ALLBUT,htmlComment
    syn sync fromstart
    set foldmethod=syntax
    set foldcolumn=1
endfunction
nmap <leader>hf <ESC>:call HtmlFold()<CR>

" TOhtml配置
let g:html_no_progress = 0
let g:html_diff_one_file = 0
let g:html_number_lines = 1
let g:html_use_css = 0
let g:html_ignore_folding = 1
let g:html_no_foldcolumn = 1
let g:html_no_pre = 1
let g:html_font="Consolas','DejaVu Sans Mono','Courier New"

" 将代码处理成适合贴到blog的html代码
function! TOhtml2(line1,line2)
    call tohtml#Convert2HTML(a:line1, a:line2)
    :%s/<!\_.*<\/head>//g
    :g/<\/html>/d
    :%s/<body\ bgcolor="\(.*\)"\ text="\(.*\)">/<div\ style="background-color:\1;color:\2">/
    :%s/<\/body>/<\/div>/
    :g/^\s*$/d
    normal ggVG
endfunction
command! -range=% TOhtml2 :call TOhtml2(<line1>,<line2>)

"--------------------------------------------------
" CFG_Autorun: 自动执行{{{1
"--------------------------------------------------

" 网页里使用tab而不是4个空格
"autocmd! BufRead *.htm,*.html,*.asp,*.php set noet

" 每次写入.vimrc都会自动载入vimrc一次
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" 语法高亮修正
" See: http://vim.wikia.com/wiki/Fix_syntax_highlighting#Highlight_from_start_of_file
"autocmd! BufEnter,bufwrite * syntax sync fromstart

" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
autocmd! BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe "norm '\"" | else | exe "norm $" | endif | endif

"--------------------------------------------------
" CFG_Abbreviation: 常用缩写{{{1
"--------------------------------------------------

" 当前日期
iab xdate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
" 当前星期
iab xweek <C-R>="星期".strpart("日一二三四五六",strftime("%w")*3,3)<CR>
" 名字
iab xname jiazhoulvke
" 邮箱
iab xemail jiazhoulvke@gmail.com
" 个人博客
iab xblog http://www.jiazhoulvke.com

"--------------------------------------------------
" CFG_Plugin_Config: 插件设置{{{1
"--------------------------------------------------

"--------------------------------------------------
" Name: nerdtree
" Description: 文件管理器
" URL: http://www.vim.org/scripts/script.php?script_id=1658)
" Git: https://github.com/scrooloose/nerdtree.git
"--------------------------------------------------
nmap <silent><F8> <ESC>:NERDTreeToggle<CR>
" 通过系统关联的程序打开NerdTree窗口光标下的文件，假如不是在NerdTree中，则打开当前buffer
function! NerdTreeOpenFile()
    if match(bufname("%"),'NERD_tree')>-1 && filereadable(g:NERDTreeFileNode.GetSelected().path.str())
        if MySys()=="windows"
            silent exe '!start explorer "' . iconv(g:NERDTreeFileNode.GetSelected().path.str(),"utf-8","gb2312") . '"'
        endif
    elseif filereadable(expand("%:p"))
        if MySys()=="windows"
            silent exe '!start explorer "' . iconv(expand("%:p"),"utf-8","gb2312") . '"'
        endif
    endif
endfunction
nmap <leader>no <ESC>:call NerdTreeOpenFile()<CR>

"--------------------------------------------------
" Name: tagbar
" Description: 类似于taglist
" URL: http://www.vim.org/scripts/script.php?script_id=3465
" Git: https://github.com/majutsushi/tagbar.git
"--------------------------------------------------
"map <silent> <F4> <ESC>:TagbarToggle<CR>
"let g:tagbar_left = 0
"let g:tagbar_width = 40
"let g:tagbar_autoclose = 0
"let g:tagbar_autoshowtag = 1
"let g:tagbar_autofocus = 0
"let g:tagbar_sort = 1
"let g:tagbar_compact = 1

"--------------------------------------------------
" Name: gundo
" Description: 打开可视化 Vim 的撤销列表
" URL: http://www.vim.org/scripts/script.php?script_id=3304)
" Git: https://github.com/vim-scripts/Gundo.git
"--------------------------------------------------
map <leader>z :GundoToggle<CR>

"--------------------------------------------------
" Name: fuzzyfinder
" Description: 文件、缓冲区查找
" URL: http://www.vim.org/scripts/script.php?script_id=1984
" Git: https://github.com/vim-scripts/FuzzyFinder.git
"--------------------------------------------------
let g:fuf_modesDisable           = []
let g:fuf_file_exclude           = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_coveragefile_exclude   = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_dir_exclude            = '\v(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_mrufile_exclude        = '\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|^(\/\/|\\\\|\/mnt\/|\/media\/)'
let g:fuf_bookmarkfile_keyDelete = '<C-]>'
let g:fuf_bookmarkdir_keyDelete  = '<C-]>'
let g:fuf_mrufile_maxItem        = 512
let g:fuf_mrucmd_maxItem         = 512

nmap <silent> <M-b>          :FufBuffer<CR>

"nmap <silent> <leader>fb     :FufBuffer<CR>
"nmap <silent> <leader>ff     :FufFile<CR>
"nmap <silent> <leader>fF     :FufFileWithCurrentBufferDir<CR>
"nmap <silent> <leader>f<C-F> :FufFileWithFullCwd<CR>
"nmap <silent> <leader>fc     :FufCoverageFileChange<CR>
"nmap <silent> <leader>fC     :FufCoverageFileChange<CR>
"nmap <silent> <leader>f<C-c> :FufCoverageFileRegister<CR>
"nmap <silent> <leader>fd     :FufDirWithCurrentBufferDir<CR>
"nmap <silent> <leader>fD     :FufDirWithFullCwd<CR>
"nmap <silent> <leader>f<C-d> :FufDir<CR>
"nmap <silent> <leader>fm     :FufMruFile<CR>
"nmap <silent> <leader>fM     :FufMruFileInCwd<CR>
"nmap <silent> <leader>f<C-m> :FufMruCmd<CR>
"nmap <silent> <leader>f<C-f> :FufBookmarkFile<CR>
"nmap <silent> <leader>faf    :FufBookmarkFileAdd<CR>
"nmap <silent> <leader>f<C-u> :FufBookmarkFileAddAsSelectedText<CR>
"nmap <silent> <leader>f<C-d> :FufBookmarkDir<CR>
"nmap <silent> <leader>fad    :FufBookmarkDirAdd<CR>
"nmap <silent> <leader>ft     :FufTag<CR>
"nmap <silent> <leader>fT     :FufTag!<CR>
"nmap <silent> <leader>f<C-]> :FufTagWithCursorWord!<CR>
"nmap <silent> <leader>f,     :FufBufferTag<CR>
"nmap <silent> <leader>f<     :FufBufferTag!<CR>
"nmap <silent> <leader>f,     :FufBufferTagWithSelectedText!<CR>
"nmap <silent> <leader>f<     :FufBufferTagWithSelectedText<CR>
"nmap <silent> <leader>f}     :FufBufferTagWithCursorWord!<CR>
"nmap <silent> <leader>f.     :FufBufferTagAll<CR>
"nmap <silent> <leader>f>     :FufBufferTagAll!<CR>
"nmap <silent> <leader>f.     :FufBufferTagAllWithSelectedText!<CR>
"nmap <silent> <leader>f>     :FufBufferTagAllWithSelectedText<CR>
"nmap <silent> <leader>f]     :FufBufferTagAllWithCursorWord!<CR>
"nmap <silent> <leader>fg     :FufTaggedFile<CR>
"nmap <silent> <leader>fG     :FufTaggedFile!<CR>
"nmap <silent> <leader>fj     :FufJumpList<CR>
"nmap <silent> <leader>fu     :FufChangeList<CR>
"nmap <silent> <leader>fq     :FufQuickfix<CR>
"nmap <silent> <leader>fl     :FufLine<CR>
"nmap <silent> <leader>fh     :FufHelp<CR>
"nmap <silent> <leader>fe     :FufEditDataFile<CR>
"nmap <silent> <leader>fr     :FufRenewCache<CR>

"--------------------------------------------------
" Name: CtrlP
" Description: 强大的文件查找工具
" Git: https://github.com/kien/ctrlp.vim.git
"--------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 0
let g:ctrlp_max_height = 20
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_working_path_mode = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.exe$\|\.so$\|\.dll$|\.html$'
\ }
let g:ctrlp_max_files = 99999
let g:ctrlp_max_depth = 64
let g:ctrlp_mruf_max = 1024
nmap <silent> <Leader>pp  :CtrlPCurWD<CR>
nmap <silent> <Leader>pf  :CtrlPCurFile<CR>
nmap <silent> <Leader>ph  :CtrlPMRUFiles<CR>
nmap <silent> <Leader>pM  :CtrlPMixed<CR>
nmap <silent> <Leader>pd  :CtrlPDir<CR>
nmap <silent> <Leader>pb  :CtrlPBuffer<CR>
nmap <silent> <Leader>pt  :CtrlPTag<CR>
nmap <silent> <Leader>pm  :CtrlPBookmarkDir<CR>
nmap <silent> <Leader>pam :CtrlPBookmarkDirAdd<CR>
nmap <silent> <Leader>pq  :CtrlPQuickfix<CR>
nmap <silent> <Leader>pr  :CtrlPRTS<CR>
nmap <silent> <Leader>pl  :CtrlPLine<CR>

nmap <silent> <M-f> :CtrlPCurWD<CR>

"--------------------------------------------------
" Name: EasyMotion
" Description: 在当前窗口快速查找相应词并移动到相应位置
" URL: http://www.vim.org/scripts/script.php?script_id=3526
" Git: https://github.com/vim-scripts/EasyMotion.git
"--------------------------------------------------
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_do_shade = 0
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

"--------------------------------------------------
" Name: ultisnips
" Description: 代码自动完成插件，类似于snipmate
" URL: http://www.vim.org/scripts/script.php?script_id=2715
" Git: https://github.com/guns/ultisnips.git
"--------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["mysnips"]

"--------------------------------------------------
" Name: MyProject
" Description: 项目管理插件
" Git: https://github.com/jiazhoulvke/myproject
"--------------------------------------------------
let g:MP_Bufread_AutoLoad = 0
let g:MP_BufEnter_AutoLoad = 1
let g:MP_Write_AutoUpdate = 0
let g:MP_Source_File_Ext_Name = 'htm,js,c,h,cpp,vim,php,py,asp'
let g:MP_ConfigTitleBar_Enable = 1
map <F3> <ESC>:MPSearchInProject <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ll <ESC>:MPLoad<CR>
nmap <leader>uu <ESC>:MPUpdateTags<CR>
nmap <leader>bb <ESC>:MPBuildTags<CR>

if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set cscopetagorder=1
    set cscopetag
    set nocscopeverbose
    nmap <C-i>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-i>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-i>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-i>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-i>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-i>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
    nmap <C-i>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
    nmap <C-i>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
endif

"--------------------------------------------------
" Name: DBGp Remote Debugger Interface
" Description: 代码调试
" URL: http://www.vim.org/scripts/script.php?script_id=2508
" Chrome_Plugin: https://chrome.google.com/webstore/detail/eadndfjplgieldjbigjakmdgkmoaaaoc/related
"--------------------------------------------------
"let g:debuggerPort = 9999
"let g:debuggerMaxDepth = 3
"let g:debuggerDedicatedTab = 1

"--------------------------------------------------
" Name: pydiction
" Description: python代码补全
" Git: git@github.com:jiazhoulvke/Pydiction.git
"--------------------------------------------------
"if MySys()=="windows"
"    let g:pydiction_location = $Vim.'/vimfiles/bundle/pydiction/complete-dict'
"else
"    let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
"endif

"--------------------------------------------------
" Name: solarized
" Description: 一个漂亮的配色方案
" Git: https://github.com/altercation/vim-colors-solarized.git
"--------------------------------------------------
if MySys()=="windows"
    let g:solarized_termcolors=16
else
    let g:solarized_termcolors=256
endif
let g:solarized_termtrans=0
let g:solarized_contrast="normal"
let g:solarized_visibility="high"
let g:solarized_underline=1
let g:solarized_italic=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_diffmode="normal"
let g:solarized_hitrail=0
let g:solarized_menu=1

"--------------------------------------------------
" Name: Utl
" Description: 处理vim中的链接
" URL: http://www.vim.org/scripts/script.php?script_id=293
" Git: https://github.com/vim-scripts/utl.vim.git
"--------------------------------------------------
"在Google中搜索光标下的单词
"if MySys()=="windows"
"    nmap ,g :exe ":Utl ol http://www.google.com/search?q=" . iconv(expand("<cword>"),"utf-8","gb2312")<CR>
"else
"    let g:utl_cfg_hdl_scm_http_system = 'silent !chromium %u'
"    let g:utl_cfg_hdl_scm_http = 'silent !chromium %u'
"    nmap ,g :exe ":Utl ol http://www.google.com/search?q=" . expand("<cword>")<CR>
"endif
" 在浏览器中打开光标下的网址
"nmap <leader>ub <ESC>:Utl<CR>

"--------------------------------------------------
" Name: powerline
" Description: 漂亮的状态栏
" Git: https://github.com/Lokaltog/vim-powerline.git
"--------------------------------------------------
"let g:Powerline_symbols = 'unicode'

"--------------------------------------------------
" Name: VimIM
" Description: Vim的输入法
" Git: https://github.com/vim-scripts/VimIM.git
"--------------------------------------------------
let g:vimim_map='c-bslash'

" vim: ts=4 nowrap fdm=marker foldcolumn=1 filetype=vim
