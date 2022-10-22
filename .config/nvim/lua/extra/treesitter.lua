local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

treesitter.setup({
    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        disable = { "html" },
        extended_mode = false,
        max_file_lines = nil,
    },
    autopairs = { enable = true },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },

    -- A list of parser names, or "all"
    ensure_installed = {
        'rust', 'fish', 'bash', 'css', 'scss', 'sql', 'html', 'javascript', 'json', 'lua',
        'typescript', 'toml', 'vue', 'yaml'
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
})
