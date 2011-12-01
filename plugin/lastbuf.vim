"=============================================================
"  Script: LastBuf
"    File: plugin/lastbuf.vim
" Summary: open last closed buffers.
"  Author: Rykka.Krin <Rykka.Krin(at)gmail.com>
" Last Update: 2011-12-01
"=============================================================

let s:save_cpo = &cpo
set cpo&vim

" this option decides the max reopen buf number.
let g:lastbuf_num=20
" this option decides whether lastbuf will reopen 
" the unloaded buffer or not.
" it have the same effect of set 'hidden' on.
" if you don't want open the unloaded bufs. 
" set it to 0 and set 'nohidden'
let g:lastbuf_seekall=1

function! AddLastBuf(e) "{{{
    let b=expand('<abuf>') 
    if b <= 0
        return
    endif
    let h= &hidden || g:lastbuf_seekall
    if a:e==0 
        call insert(s:bufList,b)
    elseif a:e==1 
    elseif a:e==2 && h
    elseif a:e==3 && h
    else
        if exists("s:bufList[0]") && s:bufList[0] == b
            call remove(s:bufList,0)
        endif
    endif
endfunction "}}}
function! OpenLastBuf() "{{{
    if len(s:bufList) !=0
        exec "sb ".remove(s:bufList,0)
        if len(s:bufList) > g:lastbuf_num+10
            call remove(s:bufList,20,-1)
        endif
    endif
endfunction "}}} 
aug LastBuf "{{{
    au! 
    au VimEnter     *   let s:bufList=[]
    au BufWinLeave  *   call AddLastBuf(0)
    au BufHidden    *   call AddLastBuf(1)
    au BufUnload    *   call AddLastBuf(2)
    au BufDelete    *   call AddLastBuf(3)
    au BufWipeout   *   call AddLastBuf(4)
aug END "}}}

command! -nargs=0  LastBuf call OpenLastBuf()
if !hasmapto(':LastBuf<CR>')
  silent! nmap <unique> <silent> <c-w>z :LastBuf<CR>
  silent! nmap <unique> <silent> <c-w><c-z> :LastBuf<cr>
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:tw=78:fdm=marker:
