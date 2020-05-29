func! myspacevim#before() abort
    let base16colorspace=256

    " live update of substitution
    set inccommand=nosplit
    
    " keep n lines below and above the cursor
    set scroll=5

    " use jj as escape to exit insert mode
    inoremap jj <Esc>

    " use jsq to escape, save and quit from insert mode
    inoremap jsq <Esc>:wq<CR>

    " use ss in insert or normal mode to save
    noremap ss :w<CR>

    " use ss in insert or normal mode to save
    noremap sq :wq<CR>

    " use ss in insert or normal mode to save
    noremap qq :q<CR>

    "nnoremap ; :
    "nnoremap : ;

    nnoremap <Leader>j :GoDeclsDir<CR>

    " use ctrl-c to copy to clipboard register in visual mode
    vnoremap <C-c> "+y

    " no linters for go
    let g:go_metalinter_enabled=0
    let g:syntastic_go_checkers = ['go']

    " disable network history
    let g:netrw_dirhistmax = 0

    " run 'yarn global add standard prettier-standard babel-eslint eslint eslint-plugin-prettier' for this
    let g:ale_linters = {
              \   'javascript': ['standard'],
              \}
    let g:ale_fixers = {'javascript': ['prettier-standard']}
    let g:ale_list_window_size = 10
    let g:jsx_ext_required = 0 " Allow JSX in normal JS files
    let g:ale_completion_enabled = 1
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 1

    " Use the stdio version of OmniSharp-roslyn
    let g:OmniSharp_server_stdio = 1

    " Start vim commit message in insert mode
    autocmd FileType gitcommit exec 'au VimEnter * startinsert'

    " Override default ignore pattern in file tree to still
    " show other . files
    let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'

    let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
    \ }


endf

func! myspacevim#after() abort
    " no linters for go
    let g:go_metalinter_enabled=0
    let g:syntastic_go_checkers = ['go']
endf
