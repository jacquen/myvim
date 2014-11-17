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
"Bundle 'ack.vim'
"Bundle 'gtags.vim'
"Bundle 'PinyinSearch'
"Bundle 'VimIM'
"Bundle 'utl.vim'
"vim-multiple-cursors在终端下有bug,启动后几秒内不是normal模式
if has('gui_running')
    Bundle 'vim-multiple-cursors'
endif
if v:version < 704
    Bundle 'Pydiction'
    Bundle 'Python-mode-klen'
endif
Bundle 'EasyMotion'
"Bundle 'FuzzyFinder'
Bundle 'Gundo'
Bundle 'JSON.vim'
"Bundle 'JavaScript-Indent'
Bundle 'L9'
Bundle 'Mark'
Bundle 'PasteBin.vim'
Bundle 'VimRepress'
Bundle 'VisIncr'
Bundle 'gtk-vim-syntax'
Bundle 'jQuery'
Bundle 'matchit.zip'

"------------- github其他用户的仓库 -------------"
"Bundle 'Shougo/neocomplcache'
"Bundle 'chrisbra/csv.vim
"Bundle 'jiazhoulvke/Pydiction'
"Bundle 'kien/ctrlp.vim'
"Bundle 'mattn/calendar-vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'rson/vim-conque'
"Bundle 'bling/vim-airline'
"if v:version == 704 && has('python')
"    Bundle 'Valloric/YouCompleteMe'
"endif
Bundle 'Stormherz/tablify'
Bundle 'altercation/vim-colors-solarized'
Bundle 'asins/vimcdoc'
Bundle 'guns/ultisnips'
"Bundle 'jiazhoulvke/MarkdownView'
Bundle 'jiazhoulvke/googletranslate'
Bundle 'jiazhoulvke/imagemap'
Bundle 'jiazhoulvke/jianfan'
Bundle 'jiazhoulvke/myproject'
Bundle 'jiazhoulvke/tabular'
Bundle 'jiazhoulvke/ultilocate'
"Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle "rking/ag.vim"
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'Shougo/unite-outline'
Bundle 'sk1418/Join'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

"------------- 非github的仓库 -------------"
" 暂无
