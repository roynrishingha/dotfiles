local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

nvim_treesitter.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        'rust', 'fish', 'bash', 'css', 'scss', 'sql', 'html', 'javascript', 'json', 'lua',
        'typescript', 'cmake', 'toml', 'vue', 'yaml', 'gitignore'
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    },
    indent = {
        enable = true
    }
}
