"==================================================
" Init: 初始化{{{1
"==================================================

set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

"}}}

"==================================================
" Library: 库{{{1
"==================================================
Plug 'L9'
Plug 'xolox/vim-misc'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'mattn/webapi-vim'

"}}}

"==================================================
" UI: 界面{{{1
"==================================================
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'lilydjwg/colorizer',{'for': ['html', 'php', 'css']}

"}}}

"==================================================
" Language: 语言{{{1
"==================================================
Plug 'evanmiller/nginx-vim-syntax'
Plug 'groenewege/vim-less'
Plug 'gtk-vim-syntax'
Plug 'jQuery'
Plug 'mitsuhiko/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/tornadotmpl.vim'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xsbeats/vim-blade'

"}}}

"==================================================
" Interface: 接口{{{1
"==================================================
Plug 'Shougo/unite.vim'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/unite-outline'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimshell.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

"}}}

"==================================================
" Completion: 补全{{{1
"==================================================
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'shawncplus/phpcomplete.vim', {'for': ['php']}
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim', {'for': ['php', 'html', 'css', 'xml']}

"}}}

"==================================================
" Misc: 杂项{{{1
"==================================================
if has('gui_running')
    Plug 'vim-multiple-cursors'
endif
Plug 'Chiel92/vim-autoformat'
Plug 'EasyMotion'
Plug 'Mark'
Plug 'PasteBin.vim'
Plug 'Stormherz/tablify'
Plug 'VisIncr'
Plug 'asins/vimcdoc'
Plug 'fs111/pydoc.vim', {'for' : 'python'}
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'jiazhoulvke/ultilocate'
Plug 'jiazhoulvke/youdao_dict.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/fcitx.vim'
Plug 'luochen1990/rainbow'
Plug 'matchit.zip'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'sk1418/Join'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-session'

"}}}

"==================================================
" Plugin_list: 其他插件列表{{{1
"==================================================
" 载入本地插件列表文件
if filereadable($VIM_CFG_PATH.'/plugins.local.vim')
    source $VIM_CFG_PATH/plugins.local.vim
endif

"}}}

call plug#end()

" vim: ts=4 wrap fdm=marker foldcolumn=1 filetype=vim
