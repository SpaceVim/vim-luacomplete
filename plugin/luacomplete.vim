""
" @section Introduction, intro
" @order intro mappings
" This ia a basic completion plugin for lua file.


" check if Vim is in correct version and has Lua support
if v:version < 703
    echo 'Only Vim version 7.3 (or newer) is supported!'
    finish
endif
if !has('lua')
    echo 'Lua support must be enabled!'
    finish
endif

" as usual...
if exists('b:did_lua_completions')
    finish
endif
let b:did_lua_completions = 1

" save and reset compatibility options
let s:save_cpo = &cpo
set cpo&vim

""
" Diable/Enable default mappings in lua buffer.
" >
"   mode        key         functinon
"   normal      <leader>fl  print functin list
"   normal      <leader>lf  wirte and luafile
"   normal      <leader>sli set lua iabbrevs
"   normal      <leader>cli clear lua iabbrevs
" <
let g:luacompleteEnableDefaultMappings = 0

""
" @section Mappings, mappings
" luacomplete defined some mappings for lua buffer:
" >
"   <Plug>PrintFunctionList  print functino list
"   <Plug>WriteAndLuaFile    wirte and luafile
"   <Plug>SetLuaIabbrevs     set lua iabbrevs
"   <Plug>ClearLuaIabbrevs   clear lua iabbrevs
" <


noremap <unique> <script> <Plug>PrintFunctionList   :lua print_function_list()
noremap <unique> <script> <Plug>WriteAndLuaFile     :w
noremap <unique> <script> <Plug>SetLuaIabbrevs      :call SetLuaIabbrevs()
noremap <unique> <script> <Plug>ClearLuaIabbrevs    :call ClearLuaIabbrevs()


" Common Lua abbreviations
let s:iabbrevlist = [
            \ ['pr(', 'print('],
            \ ['con(', 'table.concat('],
            \ ['ip(', 'ipairs('],
            \ ['pa(', 'pairs('],
            \ ['ins(', 'table.insert('],
            \ ['gmatch(', 'string.gmatch('],
            \ ['find(', 'string.find('],
            \ ['sub(', 'string.sub('],
            \ ['gsub(', 'string.gsub('],
            \ ['loc', 'local'],
            \ ['unp(', 'unpack('],
            \ ['match(', 'string.match('],
            \ ['sort(', 'table.sort('],
            \ ['ty(', 'type('],
            \ ['fore(', 'table.foreach('],
            \ ['forei(', 'table.foreachi('],
            \ ['func', 'function'],
            \ ['th', 'then'],
            \ ['el', 'else'],
            \ ['ei', 'elseif'],
            \ ['rep(', 'string.rep('],
            \ ['len(', 'string.len('],
            \ ['wrap(', 'coroutine.wrap('],
            \ ['yield(', 'coroutine.yield(']
            \ ]

function! SetLuaIabbrevs()
    for a in s:iabbrevlist
        execute 'iabbrev ' . a[0] . ' ' . a[1]
    endfor
endfunction

function! ClearLuaIabbrevs()
    for a in s:iabbrevlist
        execute 'iunabbrev ' . a[0]
    endfor
endfunction

" restore compatibility options
let &cpo = s:save_cpo
