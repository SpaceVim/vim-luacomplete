" source Lua...
exe 'luafile ' . fnamemodify(expand('<sfile>'), ':h:h').'/lib/luavi/luacomplete.lua'


""
" @public
" this function is the omnifunc for lua file. to enable lua complete, add this
" to you vimrc.
" >
"   autocmd FileType lua setlocal omnifunc=luacomplete#complete
" <
function! luacomplete#complete(findstart, base) abort
    lua completefunc_luacode()
endfunction

function! luacomplete#foldlevel(linenum) abort
    lua foldlevel_luacode()
endfunction
