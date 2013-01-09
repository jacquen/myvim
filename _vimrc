" 禁止vim以兼容vi的模式运行
set nocompatible

"--------------------------------------------------
" Config_Base: 基本设置{{{1
"--------------------------------------------------

"--------------------------------------------------
" Name: pathogen
" Description: 将所有插件分别放在不同的文件，方便管理
" URL: http://www.vim.org/scripts/script.php?script_id=2332
"--------------------------------------------------
"这行代码必须放在前面，否则会产生异常
call pathogen#infect()

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

" 载入本地配置
if filereadable($VIM_CFG_PATH.'/local_config.vim')
    source $VIM_CFG_PATH/local_config.vim
endif

" 设置vim内部编码
set encoding=utf-8

" 设置文件编码集 :help encoding-values
set fileencodings=ucs-bom,utf-8,chinese,gbk,gb18030,taiwan,japan,korea,latin-1

" 设置文件编码为utf-8
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

" 特定类型插件支持
filetype plugin on

" 特定类型文件缩进
filetype indent on

" 语法高亮
syntax on

"设置背景颜色类型
set background=dark

"设置背景颜色
if MySys()=="windows"
    set t_Co=16
else
    set t_Co=256
endif

" 语法高亮的同步行数
let g:vimsyn_minlines=500
let g:vimsyn_maxlines=5000

" 配色方案
if has("gui_running")
    colo solarized
else
    colo desert
    "colo solarized
endif

" 极为重要的选项，解决一行代码过长就容易看不到的现象
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
set statusline=%F\ [CWD=%{getcwd()}][%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][%Y]\%h%m%r%=[ASCII=\%03.3b]\ %LL\ %l,%c%V\ %P\ %{strftime(\"%Y-%m-%d\ %H:%M:%S\")}

" gui模式下启动时自动最大化
"if has("gui_running")
"    if MySys()=="windows"
"        au GUIEnter * simalt ~x
"    else
"        au GUIEnter * set lines=999
"        au GUIEnter * set columns=999
"    endif
"endif

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

" 使用Shift+方向键选择文本
set keymodel=startsel,stopsel

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

" 比较函数
"function! MyDiff()
"    let opt = '-a --binary '
"    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"    let arg1 = v:fname_in
"    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"    let arg2 = v:fname_new
"    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"    let arg3 = v:fname_out
"    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"    let eq = ''
"    if $VIMRUNTIME =~ ' '
"        if &sh =~ '\<cmd'
"            let cmd = '""' . $VIMRUNTIME . '\diff"'
"            let eq = '"'
"        else
"            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"        endif
"    else
"        let cmd = $VIMRUNTIME . '\diff'
"    endif
"    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
"set diffexpr=MyDiff()

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
autocmd BufWritePre * call RemoveTrailingWhitespace()

"--------------------------------------------------
" Config_BindKey:  按键绑定{{{1
"--------------------------------------------------

"设置leader为,
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

" windows下通过键盘控制窗口大小
if MySys()=="windows"
    "窗口最大化
    map <leader>max <ESC>:simalt ~x<CR>
    "窗口最小化
    map <leader>min <ESC>:simalt ~n<CR>
    "窗口恢复默认大小
    map <leader>res <ESC>:simalt ~r<CR>
"else
    ""窗口最大化
    "map <leader>max <ESC>:set columns=999<CR> <ESC>:set lines=999<CR>
    ""窗口恢复默认大小
    "map <leader>res <ESC>:set columns=80<CR> <ESC>:set lines=25<CR>
endif

"映射j、k为每次移动相对屏幕的一行
nmap j gj
nmap k gk

"映射Alt+j/k/h/l为方向键
map <M-j> <Down>
map <M-k> <Up>
map <M-h> <Left>
map <M-l> <Right>

"命令行模式下的移动
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <M-f> <C-Right>
cmap <M-b> <C-Left>

"重新载入vimrc配置
map <leader>rr <ESC>:so $MYVIMRC<CR>

"打开vimrc
map <leader>ee <ESC>:e $MYVIMRC<CR>

"Ctrl-S保存
map <C-s> <ESC>:update<CR>
imap <C-s> <ESC>:update<CR>

"CTRL-D全选
nmap <C-D> gggH<C-O>G
imap <C-D> <C-O>gg<C-O>gH<C-O>G
"cmap <C-D> <C-C>gggH<C-O>G
omap <C-D> <C-C>gggH<C-O>G
smap <C-D> <C-C>gggH<C-O>G
xmap <C-D> <C-C>ggVG

"CTRL-X剪切
vmap <C-X> "+x

"Ctrl+C复制
vmap <C-C> "+y

"CTRL-V粘贴
map <C-V> "+gp
imap <C-V> <C-O>"+gp
cmap <C-V> <C-R>+

"由于C-V用作粘贴，所以用vv做列选择模式
nmap vv <C-Q>

" 普通模式下复制文件路径
nmap <C-C> :let @+=expand('%:p')<CR>

"linux常用剪贴复制粘贴快捷键
vmap <S-Del> "+x
vmap <C-Insert> "+y
map <S-Insert> "+gP
cmap <S-Insert> <C-R>+

"leader-AX 全选并剪切
map <leader>ax <ESC>ggVG "+x

"leader-AC 全选并复制
map <leader>ac <ESC>:0,$yank +<CR>

"leader-AV 全选并粘贴
map <leader>av <ESC>ggVG "+gP

"插入模式下上开一行
imap <C-CR> <ESC>O

"插入模式下CTRL+d删除后面的字符
imap <C-d> <del>

"插入模式下以emacs的方式移动光标
imap <C-a> <home>
imap <C-e> <end>

"空格键向下翻页,Shift+空格向上翻页
nmap <space> <C-f>
nmap <S-space> <C-b>

"使用Tab缩进
nmap <Tab> v>
nmap <S-Tab> v<

"用CTRL+方向键调整窗口大小
nmap <C-up> <C-w>+
nmap <C-down> <C-w>-
nmap <C-left> <C-w><
nmap <C-right> <C-w>>

"alt+h/j/k/l切换窗口
nmap <M-s> <C-W>j
nmap <M-w> <C-W>k
nmap <M-a> <C-W>h
nmap <M-d> <C-W>l

"设置编码语言
nmap <leader>lhtm :set syn=xhtml  <Bar> set filetype=xhtml<CR>
nmap <leader>lasp :set syn=aspvbs <Bar> set filetype=asp<CR>
nmap <leader>lphp :set syn=php    <Bar> set filetype=php<CR>
nmap <leader>lvim :set syn=vim    <Bar> set filetype=vim<CR>
nmap <leader>lc   :set syn=c      <Bar> set filetype=c<CR>
nmap <leader>lsql :set syn=sql    <Bar> set filetype=sql<CR>
nmap <leader>lpy  :set syn=python <Bar> set filetype=python<CR>

"转换文件编码
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

"替换\为/
vmap <leader>s\ :s/\\/\//g<CR>:noh<CR>
"替换/为\
vmap <leader>s/ :s/\//\\/g<CR>:noh<CR>

"一键运行单个文件
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

"进入当前buffer所在的目录
map <leader>cd :cd %:p:h<cr>

"取消搜索高亮
nmap <leader>nh :noh<CR>

"删除^M
noremap <Leader>dm mmHmn:%s/<C-V><cr>//ge<cr>'nzt'm

"删除空行
noremap <Leader>dbl :g/^\s*$/d<CR>

"从剪贴板上过滤非可打印字符
nmap <leader>p :let @* = substitute(@*,'[^[:print:]]','','g')<cr>"*p

"折叠html代码
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

"TOhtml配置
let g:html_no_progress = 0
let g:html_diff_one_file = 0
let g:html_number_lines = 1
let g:html_use_css = 0
let g:html_ignore_folding = 1
let g:html_no_foldcolumn = 1
let g:html_no_pre = 1
let g:html_font="Consolas','DejaVu Sans Mono','Courier New','Arial"

"将代码处理成适合贴到blog的html代码
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
" Config_Autorun: 自动执行{{{1
"--------------------------------------------------

"网页里使用tab而不是4个空格
"autocmd! BufRead *.htm,*.html,*.asp,*.php set noet

" 每次写入.vimrc都会自动载入vimrc一次
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" 语法高亮修正
" See: http://vim.wikia.com/wiki/Fix_syntax_highlighting#Highlight_from_start_of_file
"autocmd! BufEnter,bufwrite * syntax sync fromstart

" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
autocmd! BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe "norm '\"" | else | exe "norm $" | endif | endif

"--------------------------------------------------
" Config_Abbreviation: 常用缩写{{{1
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
iab xblog http://jiazhoulvke.com

"--------------------------------------------------
" Config_Plugin: 插件设置{{{1
"--------------------------------------------------

"--------------------------------------------------
" Name: VimWiki
" Description: 写日记、做笔记
" URL: http://www.vim.org/scripts/script.php?script_id=2226
" Git: https://github.com/vim-scripts/vimwiki.git
"--------------------------------------------------
let g:vimwiki_use_mouse=1
let g:vimwiki_camel_case=0
let g:vimwiki_CJK_length=1
"wiki路径配置在local_config.vim中

"--------------------------------------------------
" Name: colorpicker
" Description: 调用调色板
" URL: http://lilydjwg.is-programmer.com/posts/21636.html
"--------------------------------------------------
inoremap <M-c> <C-R>=Lilydjwg_colorpicker()<CR>
nmap cac :call Lilydjwg_changeColor()<CR>

"--------------------------------------------------
" Name: jianfan
" Description: 简繁转换
" URL: http://www.vim.org/scripts/script.php?script_id=3547
" Git: https://github.com/jiazhoulvke/jianfan.git
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
nmap <leader>uo <ESC>:call NerdTreeOpenFile()<CR>

"--------------------------------------------------
" Name: tabbar
" Description: 标签式Buffer管理
" Git: https://github.com/vim-scripts/TabBar.git
"--------------------------------------------------
"let Tb_loaded = 1

"--------------------------------------------------
" Name: tagbar
" Description: 类似于taglist
" URL: http://www.vim.org/scripts/script.php?script_id=3465
" Git: https://github.com/majutsushi/tagbar.git
"--------------------------------------------------
map <silent> <F4> <ESC>:TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 40
let g:tagbar_autoclose = 0
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 0
let g:tagbar_sort = 1
let g:tagbar_compact = 1

"--------------------------------------------------
" Name: gundo
" Description: 打开可视化 Vim 的撤销列表
" URL: http://www.vim.org/scripts/script.php?script_id=3304)
" Git: https://github.com/vim-scripts/Gundo.git
"--------------------------------------------------
map <leader>z :GundoToggle<CR>

"--------------------------------------------------
" Name: visualmark
" Description: 可视化的书签
" URL: http://www.vim.org/scripts/script.php?script_id=1026
" Git: https://github.com/vim-scripts/Visual-Mark.git
"--------------------------------------------------
" 添加/删除书签
"map <silent> <leader>mm <ESC>:call Vm_toggle_sign()<CR>
map <leader>mm <Plug>Vm_toggle_sign
" 下一个书签
map <M-,> <Plug>Vm_goto_prev_sign
" 上一个书签
map <M-.> <Plug>Vm_goto_next_sign

"--------------------------------------------------
" Name: neocomplcache
" Description: 自动补全插件
" URL: http://www.vim.org/scripts/script.php?script_id=2620
" Git: https://github.com/Shougo/neocomplcache.git
"--------------------------------------------------
""let g:loaded_neocomplcache=1
"" Disable AutoComplPop
"let g:acp_enableAtStartup=0
"" Use neocomplcache
"let g:neocomplcache_enable_at_startup=1
"let g:neocomplcache_enable_quick_match=0
"let g:neocomplcache_disable_auto_complete=0
"let g:neocomplcache_enable_ignore_case=1
"let g:neocomplcache_enable_smart_case=1
"let g:neocomplcache_enable_auto_select=0
"let g:neocomplcache_enable_camel_case_completion=1
"let g:neocomplcache_enable_underbar_completion=1
"let g:neocomplcache_enable_fuzzy_completion=0
"let g:neocomplcache_fuzzy_completion_start_length=4
"let g:neocomplcache_min_syntax_length=1
"let g:neocomplcache_manual_completion_start_length=2
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_max_list=64
"let g:neocomplcache_menu_width=16
"let g:neocomplcache_release_cache_time=300
"let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'
"
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'aspvbs' : $VIM_CFG_PATH.'/dicts/asp.txt,'.$VIM_CFG_PATH.'/dicts/css.txt,'.$VIM_CFG_PATH.'/dicts/javascript.txt',
"    \ 'php' : $VIM_CFG_PATH.'/dicts/php.txt,'.$VIM_CFG_PATH.'/dicts/css.txt,'.$VIM_CFG_PATH.'/dicts/javascript.txt',
"    \ 'html' : $VIM_CFG_PATH.'/dicts/css.txt,'.$VIM_CFG_PATH.'/dicts/javascript.txt',
"    \ 'css' : $VIM_CFG_PATH.'/dicts/css.txt',
"    \ 'javascript' : $VIM_CFG_PATH.'/dicts/javascript.txt'
"    \ }
"
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"
"
""inoremap <expr><C-i>  neocomplcache#start_manual_complete()
"inoremap <expr><C-y> neocomplcache#close_popup()
"inoremap <expr><C-e> neocomplcache#cancel_popup()
"inoremap <expr><C-g> neocomplcache#undo_completion()
"inoremap <expr><C-l> neocomplcache#complete_common_string()
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
""autocmd FileType php setlocal completefunc=phpcomplete#CompletePHP
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

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
"nmap <silent> <M-f>          :FufFile<CR>

nmap <silent> <leader>fb     :FufBuffer<CR>
nmap <silent> <leader>ff     :FufFile<CR>
nmap <silent> <leader>fF     :FufFileWithCurrentBufferDir<CR>
nmap <silent> <leader>f<C-F> :FufFileWithFullCwd<CR>
nmap <silent> <leader>fc     :FufCoverageFileChange<CR>
nmap <silent> <leader>fC     :FufCoverageFileChange<CR>
nmap <silent> <leader>f<C-c> :FufCoverageFileRegister<CR>
nmap <silent> <leader>fd     :FufDirWithCurrentBufferDir<CR>
nmap <silent> <leader>fD     :FufDirWithFullCwd<CR>
nmap <silent> <leader>f<C-d> :FufDir<CR>
nmap <silent> <leader>fm     :FufMruFile<CR>
nmap <silent> <leader>fM     :FufMruFileInCwd<CR>
nmap <silent> <leader>f<C-m> :FufMruCmd<CR>
nmap <silent> <leader>f<C-f> :FufBookmarkFile<CR>
nmap <silent> <leader>faf    :FufBookmarkFileAdd<CR>
nmap <silent> <leader>f<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nmap <silent> <leader>f<C-d> :FufBookmarkDir<CR>
nmap <silent> <leader>fad    :FufBookmarkDirAdd<CR>
nmap <silent> <leader>ft     :FufTag<CR>
nmap <silent> <leader>fT     :FufTag!<CR>
nmap <silent> <leader>f<C-]> :FufTagWithCursorWord!<CR>
nmap <silent> <leader>f,     :FufBufferTag<CR>
nmap <silent> <leader>f<     :FufBufferTag!<CR>
nmap <silent> <leader>f,     :FufBufferTagWithSelectedText!<CR>
nmap <silent> <leader>f<     :FufBufferTagWithSelectedText<CR>
nmap <silent> <leader>f}     :FufBufferTagWithCursorWord!<CR>
nmap <silent> <leader>f.     :FufBufferTagAll<CR>
nmap <silent> <leader>f>     :FufBufferTagAll!<CR>
nmap <silent> <leader>f.     :FufBufferTagAllWithSelectedText!<CR>
nmap <silent> <leader>f>     :FufBufferTagAllWithSelectedText<CR>
nmap <silent> <leader>f]     :FufBufferTagAllWithCursorWord!<CR>
nmap <silent> <leader>fg     :FufTaggedFile<CR>
nmap <silent> <leader>fG     :FufTaggedFile!<CR>
nmap <silent> <leader>fj     :FufJumpList<CR>
nmap <silent> <leader>fu     :FufChangeList<CR>
nmap <silent> <leader>fq     :FufQuickfix<CR>
nmap <silent> <leader>fl     :FufLine<CR>
nmap <silent> <leader>fh     :FufHelp<CR>
nmap <silent> <leader>fe     :FufEditDataFile<CR>
nmap <silent> <leader>fr     :FufRenewCache<CR>

"常用模式
function! SelectFuzzyFinderMode()
    let fufmodelist = [
                \ { "FufBuffer"       : "Buffer mode (fuf-buffer-mode)" },
                \ { "FufFile"         : "File mode (fuf-file-mode)" },
                \ { "FufCoverageFile" : "Coverage-File mode (fuf-coveragefile-mode)" },
                \ { "FufDir"          : "Directory mode (fuf-dir-mode)" },
                \ { "FufMruFile"      : "MRU-File mode (fuf-mrufile-mode)" },
                \ { "FufMruCmd"       : "MRU-Command mode (fuf-mrucmd-mode)" },
                \ { "FufBookmarkFile" : "Bookmark-File mode (fuf-bookmarkfile-mode)" },
                \ { "FufBookmarkDir"  : "Bookmark-Dir mode (fuf-bookmarkdir-mode)" },
                \ { "FufTag"          : "Tag mode (fuf-tag-mode)" },
                \ { "FufBufferTag"    : "Buffer-Tag mode (fuf-buffertag-mode)" },
                \ { "FufTaggedFile"   : "Tagged-File mode (fuf-taggedfile-mode)" },
                \ { "FufJumpList"     : "Jump-List mode (fuf-jumplist-mode)" },
                \ { "FufChangeList"   : "Change-List mode (fuf-changelist-mode)" },
                \ { "FufQuickfix"     : "Quickfix mode (fuf-quickfix-mode)" },
                \ { "FufLine"         : "Line mode (fuf-line-mode)" },
                \ { "FufHelp"         : "Help mode (fuf-help-mode)" }
                \ ]
    let fufmodenum = 1
    let fufmodecmddic = {}
    let fufmodeliststr = [printf("%4s %-16s\t%s","序号","命令","说明")]
    for t1 in fufmodelist
        let tl1 = items(t1)[0]
        let fufmodecmddic[fufmodenum] = tl1[0]
        let fufmodestrlist = add(fufmodeliststr ,  printf("%4d %-16s\t%s",fufmodenum,tl1[0],tl1[1]))
        let fufmodenum = fufmodenum + 1
    endfor
    redraw
    let selectmode = inputlist(fufmodestrlist)
    if selectmode<1 || selectmode>len(fufmodestrlist)
        return
    endif
    exe fufmodecmddic[selectmode]
endfunction
command! FuzzyFinderMode :call SelectFuzzyFinderMode()

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
"nmap <silent> <M-b> :CtrlPBuffer<CR>

"--------------------------------------------------
" Name: Indent Guides
" Description: 显示缩进参考线
" URL: http://www.vim.org/scripts/script.php?script_id=3361
" Git: https://github.com/nathanaelkane/vim-indent-guides.git
"--------------------------------------------------
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444444 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#555555 ctermbg=4

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
" Description: 我的项目管理插件
" Git: https://github.com/jiazhoulvke/myproject
" Reference: http://easwy.com/blog/archives/automatically_update_ctags_tag_cscope_database/
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
let g:debuggerPort = 9999
let g:debuggerMaxDepth = 3
let g:debuggerDedicatedTab = 1

"--------------------------------------------------
" Name: VimPdb
" Description: python代码调试
" URL: http://www.vim.org/scripts/script.php?script_id=2043
"--------------------------------------------------

"--------------------------------------------------
" Name: vimrepress
" Description: 写blog的神器
" Git: https://github.com/vim-scripts/VimRepress.git
"--------------------------------------------------

"--------------------------------------------------
" Name: vim-lua-ftplugin
" Description: lua插件
" Git: https://github.com/xolox/vim-lua-ftplugin.git
"--------------------------------------------------
let g:lua_complete_omni=1
let g:lua_check_syntax=1
let g:lua_complete_library=1
let g:lua_complete_dynamic=1
let g:lua_complete_globals=1

"--------------------------------------------------
" Name: rainbow_parentheses
" Description: 多重括号高亮
" Git: https://github.com/kien/rainbow_parentheses.vim.git
"--------------------------------------------------
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound "()
"au Syntax * RainbowParenthesesLoadSquare "[]
"au Syntax * RainbowParenthesesLoadBraces "{}

"--------------------------------------------------
" Name: pydiction
" Description: python代码补全
" Git: https://github.com/vim-scripts/Pydiction.git
"--------------------------------------------------
"不够人性化，无法自定义快捷键，与其他插件冲突，禁用之
"if MySys()=="windows"
"    let g:pydiction_location = $Vim.'/vimfiles/bundle/Pydiction/complete-dict'
"else
"    let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
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
if MySys()=="windows"
    nmap ,g :exe ":Utl ol http://www.google.com/search?q=" . iconv(expand("<cword>"),"utf-8","gb2312")<CR>
else
    let g:utl_cfg_hdl_scm_http_system = 'silent !chromium %u'
    let g:utl_cfg_hdl_scm_http = 'silent !chromium %u'
    nmap ,g :exe ":Utl ol http://www.google.com/search?q=" . expand("<cword>")<CR>
endif
"在浏览器中打开光标下的网址
nmap <leader>ub <ESC>:Utl<CR>

"--------------------------------------------------
" Name: CSV
" Description: 处理CSV
" Git: https://github.com/vim-scripts/csv.vim.git
"--------------------------------------------------
let g:csv_delim=','

"--------------------------------------------------
" Name: genutils
" Description: 函数库
" Git: https://github.com/vim-scripts/genutils.git
"--------------------------------------------------

"--------------------------------------------------
" Name: nerdcommenter
" Description: 代码注释
" Git: https://github.com/scrooloose/nerdcommenter.git
"--------------------------------------------------

"--------------------------------------------------
" Name: phpcomplete
" Description: php代码补全
" Git: https://github.com/shawncplus/phpcomplete.vim.git
"--------------------------------------------------

"--------------------------------------------------
" Name: surround
" Description: Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
" Git: https://github.com/tpope/vim-surround.git
"--------------------------------------------------

"--------------------------------------------------
" Name: visincr
" Description: The visincr plugin facilitates making a column of increasing or decreasing numbers, dates, or daynames.
" Git: https://github.com/vim-scripts/VisIncr.git
"--------------------------------------------------

"--------------------------------------------------
" Name: zencoding
" Description: zencoding-vim is vim script support for expanding abbreviation like zen-coding.
" Git: https://github.com/mattn/zencoding-vim.git
"--------------------------------------------------
let g:user_zen_leader_key = '<c-e>'

"--------------------------------------------------
" Name: lib-l9
" Description: 函数库
" Git: https://github.com/vim-scripts/L9.git
"--------------------------------------------------

"--------------------------------------------------
" Name: jquery
" Description: jquery语法文件
" Git: https://github.com/vim-scripts/jQuery.git
"--------------------------------------------------

"--------------------------------------------------
" Name: Mark
" Description: 高亮多个关键字
" Git: https://github.com/vim-scripts/Mark.git
"--------------------------------------------------

"--------------------------------------------------
" Name: markdown
" Description: markdown语法支持
" Git: https://github.com/tpope/vim-markdown.git
"--------------------------------------------------

"--------------------------------------------------
" Name: gtk-vim-syntax
" Description: gtk语法支持
" Git: https://github.com/vim-scripts/gtk-vim-syntax.git
"--------------------------------------------------

"--------------------------------------------------
" Name: calendar
" Description: 日历
" Git: https://github.com/mattn/calendar-vim.git
"--------------------------------------------------

"--------------------------------------------------
" Name: tabular
" Description: Vim script for text filtering and alignment
" Git: https://github.com/godlygeek/tabular.git
" Fork: https://github.com/jiazhoulvke/tabular.git
"--------------------------------------------------

"--------------------------------------------------
" Name: pastebin
" Description: 贴代码神器
" Git: https://github.com/vim-scripts/PasteBin.vim.git
"--------------------------------------------------

"--------------------------------------------------
" Name: pinyinsearch
" Description: 输入汉字的首字母即可搜索汉字
" Git: https://github.com/vim-scripts/PinyinSearch.git
"--------------------------------------------------
if MySys()=="windows"
    let g:PinyinSearch_Dict = expand("$VIM") . '\vimfiles\bundle\pinyinsearch\PinyinSearch.dict'
else
    let g:PinyinSearch_Dict = expand("$HOME") . '/.vim/bundle/pinyinsearch/PinyinSearch.dict'
endif
nnoremap <Leader>ps :call PinyinSearch()<CR>

"--------------------------------------------------
" Name: grep.vim
" Description: 使用grep搜索
" URL: http://www.vim.org/scripts/script.php?script_id=311
"--------------------------------------------------
let Grep_Path = 'grep'

" Config_Modelines: {{{1
" vim: ts=4 nowrap fdm=marker foldcolumn=1 filetype=vim
