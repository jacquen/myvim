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
Plug 'vim-scripts/L9'
Plug 'xolox/vim-misc'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'mattn/webapi-vim'
Plug 'kana/vim-operator-user'

"}}}

"==================================================
" UI: 界面{{{1
"==================================================
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'lilydjwg/colorizer',{'for': ['html', 'php', 'css']}

"}}}

"==================================================
" Language: 语言{{{1
"==================================================
Plug 'cespare/vim-toml'
Plug 'gabrielelana/vim-markdown'
Plug 'chr4/nginx.vim'
Plug 'groenewege/vim-less'
Plug 'vim-scripts/gtk-vim-syntax'
Plug 'vim-scripts/jQuery'
Plug 'jansenm/vim-cmake'
Plug 'leafgarland/typescript-vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'peterhoeg/vim-qml'
Plug 'vim-scripts/tornadotmpl.vim'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xsbeats/vim-blade'
Plug 'corylanou/vim-present'

"}}}

"==================================================
" Interface: 接口{{{1
"==================================================
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neomru.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} | Plug 'ivalkeen/nerdtree-execute'

"}}}

"==================================================
" Completion: 补全{{{1
"==================================================
Plug 'Quramy/tsuquyomi'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'} | Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'mattn/emmet-vim', {'for': ['php', 'html', 'css', 'xml']}
Plug 'pearofducks/ansible-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'shawncplus/phpcomplete.vim', {'for': ['php']}
"Plug 'ternjs/tern_for_vim', {'for': ['javascript','html']}

"}}}

"==================================================
" Misc: 杂项{{{1
"==================================================
if has("gui_running")
    Plug 'vim-scripts/vim-multiple-cursors'
endif
Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/LargeFile'
Plug 'Stormherz/tablify'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-scripts/VisIncr'
Plug 'asins/vimcdoc'
Plug 'easymotion/vim-easymotion'
Plug 'jiazhoulvke/MarkdownView'
Plug 'jiazhoulvke/goldendict.vim'
Plug 'jiazhoulvke/ultilocate'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/fcitx.vim'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/matchit.zip'
Plug 'rking/ag.vim'
Plug 'ryotakato/unite-outline-vimwiki'
Plug 'scrooloose/syntastic'
Plug 'sk1418/Join'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Mark--Karkat'
Plug 'vimwiki/vimwiki'
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
