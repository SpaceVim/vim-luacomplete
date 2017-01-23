function! luacomplete#complete(findstart, base) abort
    lua completefunc_luacode()
endfunction

function! luacomplete#foldlevel(linenum) abort
    lua foldlevel_luacode()
endfunction
