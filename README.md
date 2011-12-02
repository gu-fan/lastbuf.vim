
lastbuf.vim is a plugin to open your last closed buffers.

You can reopen your last closed buffer by :LastBuf or `<c-w><c-z>`.

buffers closed by :hid will always be opened.

buffers closed by :e # :q :only :close :bun will be reopened by default.

buffers closed by :bd will not be reopened by default.

buffers closed by :bw (!!CAUTION) will never be reopened.


you can get the newest version at https://github.com/Rykka/lastbuf.vim


    ":LastBuf mapping is <c-w><c-z> by default.
    " You can remapping it by 
    map <c-s-t> :LastBuf<CR>

    " g:lastbuf_num option decides the max reopen buf number.
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


