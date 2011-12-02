"=============================================================
"  Script: LastBuf
"    File: plugin/lastbuf.vim
" Summary: open last closed buffers.
"  Author: Rykka <Rykka10(at)gmail.com>
" Last Update: 2011-12-02
"=============================================================

let s:save_cpo = &cpo
set cpo&vim

" this option decides the max reopen buf number.
let g:lastbuf_num=20
" this option decides to reopen which level of hided buffer.
" :hid   bufhidden  (will always be reopened)
" :bun   bufunload  (will be reopened if level >= 1)
" :bd    bufdelete  (will be reopened if level >= 2)
" :bw    bufwipeout (will never be reopened!CAUTION!!)
" default is 1 , means :bd and :bw not be reopened.
" if you want the same effect of 'nohidden'. 
" set it to 0 and  set 'nohidden'
let g:lastbuf_level=1

function! s:addLastBuf() "{{{
    let b=expand('<abuf>') 
    if b > 0
        call insert(s:bufList,b)
    endif
endfunction "}}}
function! s:chkLastBuf(e)
    if ( a:e==1 && g:lastbuf_level == 0 ) 
      \ || ( a:e==2 && g:lastbuf_level == 1 )
      \ || ( a:e==3 && g:lastbuf_level >= 2 )
        let b=expand('<abuf>') 
        if b > 0 && exists("s:bufList[0]") && s:bufList[0] == b
            call remove(s:bufList,0)
        endif
    endif
endfunction
function! s:openLastBuf() "{{{
    if len(s:bufList) !=0
        exec "sb ".remove(s:bufList,0)
        if len(s:bufList) > g:lastbuf_num+10
            call remove(s:bufList,20,-1)
        endif
    endif
endfunction "}}} 
aug lastbuf#LastBuf "{{{
    au! 
    au VimEnter     *   let s:bufList=[]
    au BufWinLeave  *   call s:addLastBuf()
    " au BufHidden    *   call s:chkLastBuf(0)
    au BufUnload    *   call s:chkLastBuf(1)
    au BufDelete    *   call s:chkLastBuf(2)
    au BufWipeout   *   call s:chkLastBuf(3)
aug END "}}}

command! -nargs=0  LastBuf call <SID>openLastBuf()
if !hasmapto(':LastBuf<CR>')
  silent! nmap <unique> <silent> <c-w>z :LastBuf<CR>
  silent! nmap <unique> <silent> <c-w><c-z> :LastBuf<cr>
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:tw=78:fdm=marker:
