"--------------------------------------------------
" pathogen_install_vba.vim
" Author:       jiazhoulvke
" Email:        jiazhoulvke [AT] gmail.com
" Blog:         http://jiazhoulvke.com
" Version:      0.1
"--------------------------------------------------

if &cp || exists("g:loaded_pathogen_install_vba")
    finish
endif
let g:loaded_pathogen_install_vba="v0.1"

command! PathogenInstallVBA :call Pathogen_Install_VBA()

function! Pathogen_Install_VBA()
    let jzlk_extname=expand("%:e")
    if jzlk_extname!="vba" && jzlk_extname!="vmb"
        echo '这个文件不是vba安装包哦。'
    else
        let vba_dir_name=input("插件文件夹名: ")
        if has("win32")
            let vba_dir_path=$VIM . "\\vimfiles\\bundle\\" . vba_dir_name
            call system("md " . vba_dir_path)
        else
            let vba_dir_path="~/.vim/bundle/" . vba_dir_name
            call system("mkdir ". vba_dir_path)
        endif
        execute 'UseVimball ' . vba_dir_path
    endif
endfunction
