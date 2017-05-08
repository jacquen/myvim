" jiazhoulvke's  .vimrc

" 禁止vim以兼容vi的模式运行
set nocompatible

" 设置leader为,
let mapleader=","

" 判断当前系统
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
if filereadable($VIM_CFG_PATH.'/vimrc.local.vim')
    source $VIM_CFG_PATH/vimrc.local.vim
endif

" 载入插件列表文件
if filereadable($VIM_CFG_PATH.'/plugins.vim')
    source $VIM_CFG_PATH/plugins.vim
endif

" 载入插件配置文件
if filereadable($VIM_CFG_PATH.'/plugins.config.vim')
    source $VIM_CFG_PATH/plugins.config.vim
endif

" 载入本地插件配置文件
if filereadable($VIM_CFG_PATH.'/plugins.local.config.vim')
    source $VIM_CFG_PATH/plugins.local.config.vim
endif

" 启用插件和缩进
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
    "set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
    set guifontwide=Noto\ Sans\ Mono\ CJK\ SC\ 13
endif

"设置主题
colo solarized

set background=dark

" 设置文件换行符模式
set fileformat=unix

" 设置终端颜色
if MySys()=="windows"
    set t_Co=16
else
    set t_Co=256
endif

" 解决一行代码过长就容易看不到的现象
set display=lastline

" 去掉菜单栏
set guioptions-=m

" 折叠
set fdm=manual

" 去掉工具栏
set guioptions-=T

" 去掉右侧滚动条
set guioptions-=r

" 去掉左边的滚动条
set guioptions-=L

"设置gui标签样式
set guitablabel=%N\ %m%f

" 设置状态栏显示方式
set laststatus=2
"set statusline=%F\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][%Y]\%h%m%r%=[ASCII=\%03.3b]\ %LL\ %l,%c%V\ %P

"设置标题栏
let &titlestring="%F\ %m%r\ [%{getcwd()}]\ -\ %{v:servername}"

" 显示行号
set nu

" 打开状态栏标尺
set ruler

" 在屏幕最后一行显示当前输入的命令
set showcmd

" 不高亮显示被找到的文本
set nohls

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
set textwidth=0

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
if MySys()=="windows"
    set undodir=$TEMP
else
    set undodir=/tmp
endif

" 启用持久性撤销
set undofile

" session保存的选项
set sessionoptions-=help

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

au FileType html,ruby setlocal sw=2 ts=2

" TAB替换为空格
set et

au FileType go setlocal noet

" 智能tab
set smarttab

" 关闭自动备份
set nobackup

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

" 补全方式
set completeopt=menu
set complete=.,w,b,u,t,k

" 自动补全的方式
set wildmode=list:full
set wildmenu

" 设置make程序
set makeprg=make

" 设置编译器
"compiler gcc

"使用系统默认程序打开光标下的文件
if MySys()=="windows"
    nmap gx <ESC>:!start explorer <cfile><CR>
else
    nmap gx <ESC>:call system('xdg-open '.expand('<cfile>'))<CR>
endif

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

"输入:Man 关键字就可以直接在vim中查看man手册
source $VIMRUNTIME/ftplugin/man.vim

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

" 调试
nmap <silent><F6> <ESC>:w<CR>:call MyDebug()<CR>
function! MyDebug()
    if &filetype=='go'
        :!godebug run %
    endif
endfunction

"切换tab
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
map <M-0> :tablast<CR>

" 映射j、k为每次移动相对屏幕的一行
nmap j gj
nmap k gk

" 映射Alt+j/k/h/l为方向键
imap <M-j> <Down>
imap <M-k> <Up>
imap <M-h> <Left>
imap <M-l> <Right>

" 命令行模式下的移动
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <M-f> <C-Right>
cmap <M-b> <C-Left>

" 重新载入vimrc配置
map <leader>rr <ESC>:so $MYVIMRC<CR>

" 打开vimrc
map <leader>ee <ESC>:e $MYVIMRC<CR>

" 打开本地vimrc
map <leader>ele <ESC>:e $VIM_CFG_PATH/vimrc.local.vim<CR>

" 打开插件列表文件
nmap <leader>ep <ESC>:e $VIM_CFG_PATH/plugins.vim<CR>

" 打开插件配置文件
nmap <leader>ecp <ESC>:e $VIM_CFG_PATH/plugins.config.vim<CR>

" 打开本地插件列表文件
nmap <leader>elp <ESC>:e $VIM_CFG_PATH/plugins.local.vim<CR>

" 打开本地插件配置文件
nmap <leader>elcp <ESC>:e $VIM_CFG_PATH/plugins.local.config.vim<CR>

" Ctrl-S保存
map <C-s> <ESC>:update<CR>
imap <C-s> <ESC>:update<CR>

" CTRL-X剪切
vmap <C-X> "+x

" Ctrl+C复制
vmap <C-C> "+y

" CTRL-V粘贴
nmap <C-V> "+gp
vmap <C-V> "+gp
imap <C-V> <C-O>"+gp

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

" Alt+a/s/d/w切换窗口
nmap <M-s> <C-W>j
nmap <M-w> <C-W>k
nmap <M-a> <C-W>h
nmap <M-d> <C-W>l

" 替换\为/
vmap <leader>s\ :s/\\/\//g<CR>:noh<CR>
" 替换/为\
vmap <leader>s/ :s/\//\\/g<CR>:noh<CR>

" 一键运行单个文件
let g:RunFile_Params=''
map <F5> <ESC>:w<CR>:call RunFile()<CR>
map <leader><F5> <ESC>:w<CR>:call RunFileWithParams()<CR>

func! RunFileWithParams()
    let g:RunFile_Params=input('请输入参数:')
    call RunFile()
endfunc

func! RunFile()
    if &filetype=='vim'
        source %
    elseif &filetype=='python'
        if stridx(getline(1), 'python3') == -1
            exec '!python % '.g:RunFile_Params
        else
            exec '!python3 % '.g:RunFile_Params
        endif
    elseif &filetype=='lua'
        exec '!lua % '.g:RunFile_Params
    elseif &filetype=='go'
        exec ':!go run % '.g:RunFile_Params
    elseif &filetype=='php'
        exec ':!php % '.g:RunFile_Params
    elseif &filetype=='c'
        let l:makefile = "Makefile"
        let l:key = "vim_run_object"
        if filereadable(l:makefile)
            let l:content = join(readfile(l:makefile),"\n")
            let l:start = stridx(l:content,l:key)
            if l:start != -1
                let l:start = l:start + strlen(l:key)+1
                let l:end = stridx(l:content,"\n",l:start)
                let l:object = strpart(l:content,l:start,l:end-l:start)
                exe "make" | exe "!./".l:object.' '.g:RunFile_Params
            endif
        else
            if exists('g:ccprg')
                let b:ccprg = g:ccprg
            else
                let b:ccprg = 'gcc'
            endif
            if exists('g:ccopt')
                let b:ccopt = g:ccopt
            else
                let b:ccopt = ''
            endif
            if MySys()=="windows"
                exe '!' . b:ccprg . ' ' . b:ccopt . ' ' . ' "' . expand('%:p') . '" -o "' . expand('%:p:r') . '.exe"'
                exe '!' . expand('%:p:r') . '.exe'.' '.g:RunFile_Params
            else
                exe '!' . b:ccprg . ' ' . b:ccopt . ' '  . ' "' . expand('%:p') . '" -o "' . expand('%:p:r') . '"'
                exe '!' . expand('%:p:r').' '.g:RunFile_Params
            endif
        endif
    elseif &filetype=='html' || &filetype=='xhtml'
        if MySys()=="windows"
            exe '!start explorer.exe "' . iconv(expand('%:p'),"utf-8","gb2312") . '"'
        else
            if executable('google-chrome')
                exe '!google-chrome "' . expand('%:p') . '"'
            elseif executable('chromium-browser')
                exe '!chromium-browser "' . expand('%:p') . '"'
            elseif executable('firefox')
                exe '!firefox "' . expand('%:p') . '"'
            endif
        endif
    elseif &filetype=='sh' && executable(expand('%:p'))
        exe '!sh "' . expand('%:p') . '"'
    elseif &filetype=='dosbatch'
        exe '!cmd /c "' . iconv(expand("%:p"),"utf-8","gb2312") . '"'
    elseif expand('%') == '.Xdefault'
        !xrdb ~/.Xdefault
    endif
endfunc

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

"格式化
function! Format_File()
    if &filetype=='json'
        exe ':%!python -m json.tool'
        return
    elseif &filetype=='python'
        if executable('autopep8')
            exe ':%!autopep8 --max-line-length=1024 %'
            return
        endif
    elseif &filetype=='php'
        if executable('php_beautifier')
            exe ':%!php_beautifier --filters ArrayNested --filters "IndentStyles(style=bsd)" -f % 2>/dev/null'
            return
        endif
    elseif &filetype=='javascript'
        if executable('js-beautify')
            exe ':%!js-beautify %'
            return
        endif
    endif
    normal gg=G
endfunction
nmap <F10> <ESC>:Autoformat<CR>

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

" 语法高亮修正
" See: http://vim.wikia.com/wiki/Fix_syntax_highlighting#Highlight_from_start_of_file
autocmd! BufEnter,bufwrite * syntax sync fromstart

" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
autocmd! BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe "norm '\"" | else | exe "norm $" | endif | endif

" 自动载入GTAGS
function! AutoLoadGtags()
    let cmd = "global -pq"
    let cmd_output = system(cmd)
    if v:shell_error != 0
        return
    endif
    let gtags_path = strpart(cmd_output, 0, strlen(cmd_output) -1)
    set csprg=gtags-cscope
    exe "cs add " . gtags_path . "/GTAGS"
    set csto=0
endfunction
if has('cscope') && executable('gtags-cscope')
    if !exists('g:autoload_gtags_enabled') || g:autoload_gtags_enabled
        autocmd! BufEnter * call AutoLoadGtags()
    endif
endif

" 绑定cscope快捷键
if has("cscope")
    if !exists('g:automap_cscope_enabled') || g:automap_cscope_enabled
        set cscopequickfix=s-,c-,d-,i-,t-,e-
        set cscopetagorder=1
        set cscopetag
        set nocscopeverbose
        nmap <C-i>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-i>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
        nmap <C-i>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
        nmap <C-i>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
        nmap <C-i>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
        nmap <C-i>f :cs find f 
        nmap <C-i>i :cs find i
        nmap <C-i>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    endif
endif

"生成GTAGS
function! Build_Gtags()
    let tags_config = {}
    if exists('g:tags_config_files_name')
        let tags_config['files_name'] = g:tags_config_files_name
    else
        let tags_config['files_name'] = 'gtags.files'
    endif
    if exists('g:tags_config_files_cmd')
        let tags_config['files_cmd'] = g:tags_config_files_cmd
    else
        if executable('ag')
            let tags_config['files_cmd'] = 'ag --follow --nocolor --nogroup --hidden -g ""'
        else
            let tags_config['files_cmd'] = 'find . -type f -print'
        endif
    endif
    if exists('g:tags_config_build_cmd')
        let tags_config['build_cmd'] = g:tags_config_build_cmd
    else
        let tags_config['build_cmd'] = 'gtags'
    endif
    if filereadable('.tags.cfg')
        let config_list = readfile('.tags.cfg')
        call filter(config_list, 'v:val !~ "^#"')
        for config in config_list
            let splitpos = stridx(config, '=')
            let c_key = strpart(config, 0, splitpos)
            let c_value = strpart(config, splitpos + 1)
            let tags_config[c_key] = c_value
        endfor
    endif
    exe '!' . tags_config['files_cmd'] . ' > ' . tags_config['files_name']
    exe '!' . tags_config['build_cmd']
    if has_key(tags_config,'append_cmd')
        exe '!' . tags_config['append_cmd']
    endif
endfunction
if !exists('g:automap_build_tags_enabled') || g:automap_build_tags_enabled
    map <F11> <ESC>:call Build_Gtags()<CR>
endif

func! GoPlay()
    let output=system('mktemp -p $GOPATH/src -d')
    let tempfolder=split(output,'\n')[0]
    let main=tempfolder.'/main.go'
    call system('touch '.main)
    call writefile(['package main', '', 'import (','"fmt"',')', '', 'func main() {', '', '}'], main)
    exec ':lcd '.tempfolder
    exec ':e main.go'
endfunc
map <leader>g <ESC>:call GoPlay()<CR>

func! PHPPlay()
    let output=system('mktemp -d')
    let tempfolder=split(output,'\n')[0]
    let main=tempfolder.'/main.php'
    call system('touch '.main)
    call writefile(['<?php',''], main)
    exec ':lcd '.tempfolder
    exec ':e main.php'
endfunc
map <leader>p <ESC>:call PHPPlay()<CR>

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

" vim: ts=4 wrap fdm=marker foldcolumn=1 filetype=vim
