let g:dashboard_custom_header = [
\ '                _ooOoo_                  ',
\ '               o8888888o                 ',
\ '               88" . "88                 ',
\ '               (| -_- |)                 ',
\ '               O\  =  /O                 ',
\ "            ____/`---'\____              ",
\ "          .'  \\\\|     |//  `.            ",
\ '         /  \\|||  :  |||//  \           ',
\ '        /  _||||| -:- |||||-  \          ',
\ '        |   | \\\  -  /// |   |          ',
\ "        | \\_|  ''\\---/''  |   |         ",
\ '        \  .-\__  `-`  ___/-. /          ',
\ "      ___`. .'  /--.--\\  `. . __         ",
\ "   .\"\" '<  `.___\\_<|>_/___.'  >'\"\".     ",
\ '  | | :  `- \`.;`\ _ /`;.`/ - ` : | |    ',
\ '  \  \ `-.   \_ __\ /__ _/   .-` /  /    ',
\ "===`-.____`-.___\\_____/___.-`____.-'==== ",
\ "                `=---='                  ",
\ '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^',
\ '      佛祖保佑           永无BUG          ',
\ '',
\ '',
\ ]

function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>

autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

autocmd BufWritePre *.dart* DartFmt

autocmd FileType typescript setlocal et sta sw=4 sts=4
autocmd FileType javascript setlocal et sta sw=4 sts=4
