
lastbuf.vim is a plugin to open last closed buffers.
    
    :LastBuf
    mapping is <c-w><c-z> by default.
    you can remapping it by 
    map <c-s-t> :LastBuf<CR>

    " this option decides the max reopen buf number.
    let g:lastbuf_num=20
    " this option decides whether lastbuf will reopen 
    " the unloaded buffer or not.
    " it have the same effect of set 'hidden' on.
    " if you don't want open the unloaded bufs. set 
    " it to 0 and set 'nohidden'
    let g:lastbuf_seekall=1

