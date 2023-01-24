" REQUIRES: pdftotext
if(!executable("pdftotext"))
    echohl WarningMsg
    echo "pdf.vim: WARNING: pdftotext could not be found"
    echohl None
    finish
endif

setlocal buftype=nofile
setlocal bufhidden=hide
setlocal noswapfile

let g:pdf_vim_use_default_mappings = get(g:, 'pdf_vim_use_default_mappings', 1)
echo g:pdf_vim_use_default_mappings
if g:pdf_vim_use_default_mappings
    map <right> :call pdf#chPage(1)<CR>
    map <left> :call pdf#chPage(-1)<CR>
endif

call pdf#loadPage(1)
