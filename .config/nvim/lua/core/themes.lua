vim.g.everforest_background = 'hard'
vim.o.background = 'dark'
vim.cmd [[
    try
    colorscheme everforest
    catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
    endtry
    ]]
