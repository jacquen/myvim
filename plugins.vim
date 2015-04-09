"==================================================
" Init: 初始化{{{1
"==================================================

set nocompatible

filetype off

" 启用vundle
if MySys()=="windows"
    set rtp+=$VIM\bundle\Vundle.vim
    call vundle#begin($VIM.'\bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif


Plugin 'gmarik/Vundle.vim'

"}}}

"==================================================
" Library: 库{{{1
"==================================================
Plugin 'L9'
Plugin 'xolox/vim-misc'
Plugin 'Shougo/vimproc.vim'
Plugin 'mattn/webapi-vim'

"}}}

"==================================================
" UI: 界面{{{1
"==================================================
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'lilydjwg/colorizer'

"}}}

"==================================================
" Language: 语言{{{1
"==================================================
Plugin 'tpope/vim-markdown'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'gtk-vim-syntax'
Plugin 'jQuery'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/tornadotmpl.vim'
Plugin 'xsbeats/vim-blade'

"}}}

"==================================================
" Interface: 接口{{{1
"==================================================
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'scrooloose/nerdtree'

"}}}

"==================================================
" Completion: 补全{{{1
"==================================================
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'mattn/emmet-vim'

"}}}

"==================================================
" Misc: 杂项{{{1
"==================================================
if has('gui_running')
    Plugin 'vim-multiple-cursors'
endif
Plugin 'EasyMotion'
Plugin 'Mark'
Plugin 'PasteBin.vim'
Plugin 'Stormherz/tablify'
Plugin 'VisIncr'
Plugin 'asins/vimcdoc'
Plugin 'fs111/pydoc.vim'
Plugin 'itchyny/calendar.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'jiazhoulvke/tabular'
Plugin 'jiazhoulvke/ultilocate'
Plugin 'jiazhoulvke/vundle_config.vim'
Plugin 'jiazhoulvke/youdao_dict.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'matchit.zip'
Plugin 'rking/ag.vim'
Plugin 'sk1418/Join'
Plugin 'xolox/vim-session'

"}}}

"==================================================
" Plugin_list: 其他插件列表{{{1
"==================================================
" 载入本地插件列表文件
if filereadable($VIM_CFG_PATH.'/plugins.local.vim')
    source $VIM_CFG_PATH/plugins.local.vim
endif

"}}}

call vundle#end()

" vim: ts=4 wrap fdm=marker foldcolumn=1 filetype=vim
