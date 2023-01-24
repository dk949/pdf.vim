let s:currPage = 1
let s:lastPage = 999999999
function! s:makeCMD(num)
    return "-1 read !pdftotext % -nopgbrk -f ". a:num .' -l '. a:num .' -'
endfunction

function! pdf#loadPage(num)
    setlocal modifiable
    setlocal noreadonly
    %d
    let l:ret = 1
    silent exec s:makeCMD(a:num)
    if(v:shell_error)
        undo
        silent exec s:makeCMD(0)
        let l:ret = 0
    endif

    setlocal readonly
    setlocal nomodifiable
    return l:ret
endfunction

function! pdf#chPage(dir)
    if s:lastPage >= s:currPage + a:dir
        let s:currPage = s:currPage + a:dir
    endif
    if(s:currPage < 1)
        let s:currPage = 1
    endif
    if ! pdf#loadPage(s:currPage)
        let s:lastPage = s:currPage
    endif
endfunction
