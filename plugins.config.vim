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
" Name: rainbow
"================================================
let g:rainbow_active = 1

"================================================
" Name: colorizer
"================================================
let g:colorizer_nomap = 1
let g:colorizer_startup = 0
autocmd! BufReadPost *.php,*.html,*.htm,*.css  exe ':ColorHighlight'

"================================================
" Name: UltiLocate
" Description: 文件查找
"================================================
let g:UltiLocate_auto_close=1

"================================================
" Name: vim-easymotion
" Description: 在当前窗口快速查找相应词并移动到相应位置
"================================================
nmap g:EasyMotion_do_mapping = 0
nmap tf <Plug>(easymotion-overwin-f2)
nmap tl <Plug>(easymotion-overwin-line)
nmap tw <Plug>(easymotion-overwin-w)
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

"================================================
" Name: YouCompleteMe
" Description: 强大的补全插件
"================================================
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_invoke_completion = '<C-L>'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

"================================================
" Name: vim-session
" Description: 会话插件
"================================================
nmap <leader>s :OpenSession<CR>
let g:session_autoload = 'no'
let g:session_autosave = 'yes'


"==================================================
" Name: unite.vim
"==================================================
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
" Name: vim-airline
"==================================================
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

let g:airline_theme='powerlineish'

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
let g:yankring_replace_n_pkey = '<c-y>'
let g:yankring_history_file = '.vim_yankring_history'
let g:yankring_max_history = 16
let g:yankring_min_element_length = 5

"==================================================
" Name: calendar.vim
"==================================================
let g:calendar_frame = 'default'

"==================================================
" Name: ultisnips
"==================================================
let g:UltiSnipsExpandTrigger="<tab>"

"==================================================
" Name: vim-markdown
"==================================================
let g:vim_markdown_folding_disabled=1

"==================================================
" Name: tagbar
"==================================================
let g:tagbar_show_visibility = 1
nmap <F7> <ESC>:TagbarToggle<CR>

"==================================================
" Name: vim-go
"==================================================
autocmd FileType go nmap <Leader>bu <Plug>(go-build)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>rf <Plug>(go-referrers)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>rn <Plug>(go-rename)
autocmd FileType go nmap <Leader>dc <Plug>(go-doc)
autocmd FileType go nmap <Leader>db <Plug>(go-doc-browser)
autocmd FileType go nmap <Leader>gd <Plug>(go-def)
autocmd FileType go nmap <Leader>gt <Plug>(go-def-tab)
function! UpdateGoLibs()
    let sout = system('go list all 2>/dev/null | grep -v "^pkg/"')
    let lines = split(sout,'\n')
    let g:GoLibs = lines
endfunction

function! s:goImportComplete(ArgLead, CmdLine, CursorPos)
    if !exists('g:GoLibs')
        call UpdateGoLibs()
    endif
    let l:libs = deepcopy(g:GoLibs)
    call filter(l:libs, 'v:val =~ "'.a:ArgLead.'"')
    return l:libs
endfunction

command! -nargs=1 -complete=customlist,s:goImportComplete GoImport2 call go#import#SwitchImport(1,'',<f-args>,'')

"==================================================
" Name: fzf
"==================================================
nmap <leader>f <ESC>:FZF<CR>

"==================================================
" Name:  EasyAlign
"==================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"==================================================
" Name:  phpcomplete.vim
"==================================================
let php_sync_method = -1
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_complete_for_unknown_classes = 0
let g:phpcomplete_enhance_jump_to_definition = 1
let g:phpcomplete_min_num_of_chars_for_namespace_completion = 3
let g:phpcomplete_parse_docblock_comments = 0
let g:phpcomplete_relax_static_constraint = 0
let g:phpcomplete_search_tags_for_variables = 0
let g:phpcomplete_mappings = {
   \ 'jump_to_def': '<C-]>',
   \ 'jump_to_def_split': '<C-W><C-]>', 
   \}

"==================================================
" Name: vimwiki
"==================================================
let g:vimwiki_folding='expr'
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_menu=''
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_use_mouse=1
let g:vimwiki_toc_header = '目录'

let g:vimwiki_list = [{
\    'path': '~/Dropbox/VimWiki/',
\    'template_path': '~/Dropbox/VimWiki_html/assets/',
\    'template_default': 'default',
\    'template_ext': '.html',
\    'auto_export': 0,
\},{
\    'path': '~/VimWiki/',
\    'template_path': '~/VimWiki_html/assets/',
\    'template_default': 'default',
\    'template_ext': '.html',
\    'auto_export': 0,
\}
\]

"==================================================
" Name: vim-markdown
"==================================================
let g:markdown_enable_folding = 1
let g:markdown_enable_mappings = 1
let g:markdown_enable_insert_mode_leader_mappings = 0
let g:markdown_enable_spell_checking = 0
let g:markdown_enable_input_abbreviations = 0
