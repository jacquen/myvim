"--------------------------------------------------
" CFG_Plugin: 插件管理{{{1
"--------------------------------------------------

" 关闭文件类型检测
filetype off

" 启用vundle
if MySys()=="windows"
    set rtp+=$VIM\bundle\vundle\
    call vundle#rc('$VIM\bundle')
else
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

Bundle 'gmarik/vundle'

"--------------- vim-scripts 的仓库 ---------------"
"Bundle 'PinyinSearch'
"Bundle 'Python-mode-klen'
"Bundle 'VimIM'
"Bundle 'utl.vim'
"vim-multiple-cursors在终端下有bug,启动后几秒内不是normal模式
if has('gui_running')
    Bundle 'vim-multiple-cursors'
endif
if v:version < 704
    Bundle 'Pydiction'
endif
Bundle 'EasyMotion'
Bundle 'FuzzyFinder'
Bundle 'Gundo'
Bundle 'JSON.vim'
Bundle 'JavaScript-Indent'
Bundle 'L9'
Bundle 'Mark'
Bundle 'PasteBin.vim'
Bundle 'VimRepress'
Bundle 'VisIncr'
Bundle 'ack.vim'
Bundle 'gtags.vim'
Bundle 'gtk-vim-syntax'
Bundle 'jQuery'
Bundle 'matchit.zip'

"------------- github其他用户的仓库 -------------"
"Bundle 'Shougo/neocomplcache'
"Bundle 'asins/vimcdoc'
"Bundle 'chrisbra/csv.vim
"Bundle 'jiazhoulvke/Pydiction'
"Bundle 'kien/ctrlp.vim'
"Bundle 'mattn/calendar-vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'rson/vim-conque'
if v:version == 704 && has('python')
    Bundle 'Valloric/YouCompleteMe'
endif
Bundle 'Stormherz/tablify'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'guns/ultisnips'
Bundle 'jiazhoulvke/MarkdownView'
Bundle 'jiazhoulvke/googletranslate'
Bundle 'jiazhoulvke/imagemap'
Bundle 'jiazhoulvke/jianfan'
Bundle 'jiazhoulvke/myproject'
Bundle 'jiazhoulvke/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'sk1418/Join'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

"------------- 非github的仓库 -------------"
" 暂无


"--------------------------------------------------
" CFG_Plugin_Config: 插件设置{{{1
"--------------------------------------------------

"--------------------------------------------------
" Name: nerdtree
" Description: 文件管理器
" URL: http://www.vim.org/scripts/script.php?script_id=1658)
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
if MySys()=="windows"
    nmap <leader>no <ESC>:call NerdTreeOpenFile()<CR>
endif

"--------------------------------------------------
" Name: tagbar
" Description: 类似于taglist
" URL: http://www.vim.org/scripts/script.php?script_id=3465
"--------------------------------------------------
map <silent> <F4> <ESC>:TagbarToggle<CR>
"let g:tagbar_left = 0
"let g:tagbar_width = 40
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1
let g:tabar_indent = 1

"--------------------------------------------------
" Name: gundo
" Description: 打开可视化 Vim 的撤销列表
" URL: http://www.vim.org/scripts/script.php?script_id=3304)
"--------------------------------------------------
map <leader>z :GundoToggle<CR>
let g:gundo_width = 80
let g:gundo_preview_height = 20
let g:gundo_help = 0

"--------------------------------------------------
" Name: fuzzyfinder
" Description: 文件、缓冲区查找
" URL: http://www.vim.org/scripts/script.php?script_id=1984
"--------------------------------------------------
let g:fuf_modesDisable = ['file', 'coveragefile', 'tag', 'taggedfile', 'buffertag', 'help', 'callbackfile', 'callbackitem']
let g:fuf_mrufile_exclude        = '\v\~$|\.(o|exe|dll|orig|sw[po])$|^(\/\/|\\\\|\/mnt\/|\/media\/)'
let g:fuf_bookmarkfile_keyDelete = '<C-]>'
let g:fuf_bookmarkdir_keyDelete  = '<C-]>'
let g:fuf_mrufile_maxItem        = 1024
let g:fuf_mrucmd_maxItem         = 1024
let g:fuf_dir_exclude            = '\v(^|[/\\])\.(hg|git|bzr)($|[/\\])'

nmap <silent> <M-b>          :FufBuffer<CR>

nmap <silent> <leader>bb  :FufBuffer<CR>
nmap <silent> <leader>fd  :FufDir<CR>
nmap <silent> <leader>fmf :FufMruFile<CR>
nmap <silent> <leader>fmc :FufMruCmd<CR>
nmap <silent> <leader>fF  :FufBookmarkFile<CR>
nmap <silent> <leader>fD  :FufBookmarkDir<CR>
nmap <silent> <leader>fj  :FufJumpList<CR>
nmap <silent> <leader>fc  :FufChangeList<CR>
nmap <silent> <leader>fq  :FufQuickfix<CR>
nmap <silent> <leader>fl  :FufLine<CR>

"--------------------------------------------------
" Name: EasyMotion
" Description: 在当前窗口快速查找相应词并移动到相应位置
"--------------------------------------------------
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_do_shade = 0
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

"--------------------------------------------------
" Name: ultisnips
" Description: 代码自动完成插件，类似于snipmate
" URL: http://www.vim.org/scripts/script.php?script_id=2715
"--------------------------------------------------
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsListSnippets="<C-Q>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsSnippetDirectories=["mysnips"]

"--------------------------------------------------
" Name: MyProject
" Description: 项目管理插件
"--------------------------------------------------
let g:MP_Bufread_AutoLoad = 0
let g:MP_BufEnter_AutoLoad = 1
let g:MP_Write_AutoUpdate = 0
let g:MP_Source_File_Ext_Name = 'htm,js,c,h,cpp,vim,php,py,asp'
let g:MP_ConfigTitleBar_Enable = 1
map <F3> <ESC>:MPSearchInProject <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ll <ESC>:MPLoad<CR>
nmap <leader>ls <ESC>:MPLoadSession<CR>
nmap <leader>ss <ESC>:MPSaveSession<CR>
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
" Name: pydiction
" Description: python代码补全
"--------------------------------------------------
"if MySys()=="windows"
"    let g:pydiction_location = $Vim.'/vimfiles/bundle/Pydiction/complete-dict'
"else
"    let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"endif

"--------------------------------------------------
" Name: solarized
" Description: 一个漂亮的配色方案
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
"--------------------------------------------------
" 在Google中搜索光标下的单词
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
" Name: VimIM
" Description: Vim的输入法
"--------------------------------------------------
let g:vimim_map='c-bslash'

"--------------------------------------------------
" Name: YouCompleteMe
" Description: 强大的补全插件
"--------------------------------------------------
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_invoke_completion = '<C-L>'

"--------------------------------------------------
" Name: vim-session
" Description: 会话插件
"--------------------------------------------------
let g:session_autoload = 'no'
let g:session_autosave = 'no'

"--------------------------------------------------
" Name: vim-airline
" Description: 状态栏插件
"--------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline_enable_tagbar=1
let g:airline_detect_modified=0
let g:airline_detect_paste=1
"let g:airline_theme='solarized'
let g:airline_theme='powerlineish'

if has('gui_running')
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_branch_prefix = '⭠'
    let g:airline_readonly_symbol = '⭤'
    let g:airline_linecolumn_prefix = '⭡'
else
    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_linecolumn_prefix = '␊ '
    let g:airline_linecolumn_prefix = '␤ '
    let g:airline_linecolumn_prefix = '¶ '
    let g:airline_branch_prefix = '⎇ '
    let g:airline_paste_symbol = 'ρ'
    let g:airline_paste_symbol = 'Þ'
    let g:airline_paste_symbol = '∥'
    let g:airline_whitespace_symbol = 'Ξ'

    " powerline symbols
    "let g:airline_left_sep = ''
    "let g:airline_left_alt_sep = ''
    "let g:airline_right_sep = ''
    "let g:airline_right_alt_sep = ''
    "let g:airline_branch_prefix = ' '
    "let g:airline_readonly_symbol = ''
    "let g:airline_linecolumn_prefix = ' '
endif

"--------------------------------------------------
" Name: gtags
" Description: cscope和ctags的替代品
"--------------------------------------------------
if executable('gtags-cscope')
    set cscopeprg=gtags-cscope
endif

"--------------------------------------------------
" Name: vim-multiple-cursors
" Description: 多重光标
"--------------------------------------------------
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key="\<C-n>"
let g:multi_cursor_prev_key="\<C-p>"
"有bug，把我设置的剪切屏蔽了
"let g:multi_cursor_skip_key="\<C-x>"
let g:multi_cursor_exit_key="\<Esc>"
