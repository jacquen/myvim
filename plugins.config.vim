"================================================
" Name: nerdtree
"================================================
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

"================================================
" Name: colorizer
"================================================
let g:colorizer_nomap = 1
let g:colorizer_startup = 0
autocmd! BufReadPost *.php,*.html,*.htm,*.css  exe ':ColorHighlight'


"================================================
" Name: gundo
" Description: 打开可视化 Vim 的撤销列表
" URL: http://www.vim.org/scripts/script.php?script_id=3304)
"================================================
map <leader>z :GundoToggle<CR>
let g:gundo_width = 80
let g:gundo_preview_height = 20
let g:gundo_help = 0

"================================================
" Name: UltiLocate
" Description: 文件查找
"================================================
let g:UltiLocate_auto_close=1

"================================================
" Name: EasyMotion
" Description: 在当前窗口快速查找相应词并移动到相应位置
"================================================
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_do_shade = 0
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

"================================================
" Name: YouCompleteMe
" Description: 强大的补全插件
"================================================
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_invoke_completion = '<C-L>'

"================================================
" Name: vim-session
" Description: 会话插件
"================================================
let g:session_autoload = 'no'
let g:session_autosave = 'no'


"==================================================
" Name: unite.vim
"==================================================
nmap <leader>f :Unite -start-insert file_rec/async<CR>
nmap <leader>b :Unite -start-insert buffer<CR>
nmap <leader>h :Unite -start-insert neomru/file<CR>
nmap <F3> <ESC>:<C-u>Unite grep:.
nmap <silent> <F4> <ESC>:Unite outline<CR>
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep','ignore_pattern',join(['\.git/',],'\|'))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt=''
endif
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    nmap <buffer> <ESC> <Plug>(unite_exit)
    imap <buffer> <C-c> <Plug>(unite_exit)
endfunction

"==================================================
" Name: vim-powerline
"==================================================
let g:Powerline_symbols = 'fancy'

"==================================================
" Name: vim-colors-solarized
"==================================================
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


"==================================================
" Name: neocomplete.vim
"==================================================
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#manual_completion_start_length = 2

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\)\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"==================================================
" Name: neosnippet
"==================================================
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"==================================================
" Name: jedi-vim
"==================================================
let g:jedi#popup_select_first=0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0

"==================================================
" Name: pydoc.vim
"==================================================
let g:pydoc_cmd = 'pydoc3'
let g:pydoc_highlight = 0

"==================================================
" Name: wildfire.vim
"==================================================
let g:wildfire_fuel_map = '<C-e>'
let g:wildfire_water_map = '<M-e>'
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

"==================================================
" Name: YankRing.vim
"==================================================
let g:yankring_history_file = '.vim_yankring_history'
let g:yankring_max_history = 16
let g:yankring_min_element_length = 5
