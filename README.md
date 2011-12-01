
lastbuf.vim is a plugin to open last closed buffers.
You can reopen your last closed buffer by :LastBuf or <c-w><c-z>.
buffers closed with :hid will always be opened.
buffers closed with :e # :q :only :close :bun :bd will be reopened by default.
buffers closed with :bw (!!CAUTION) will not be reopened.

you can get the newest version at https://github.com/Rykka/lastbuf.vim


    ":LastBuf mapping is <c-w><c-z> by default.
    " You can remapping it by 
    map <c-s-t> :LastBuf<CR>

    " g:lastbuf_num option decides the max reopen buf number.
    let g:lastbuf_num=20

    " g:lastbuf_seekall option decides whether lastbuf will reopen 
    " the unloaded buffer or not.
    " if you don't want open the unloaded bufs. set 
    " it to 0 and set 'nohidden'
    let g:lastbuf_seekall=1

