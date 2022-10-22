local null_ls_ok, null_ls = pcall(require, "null-ls")
local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not (null_ls_ok and mason_null_ls_ok) then
    return
end

mason_null_ls.setup({
    ensure_installed = { 'stylua', 'jq' },
})

mason_null_ls.setup_handlers {
    function(source_name)
        -- all sources with no handler get passed here
    end,
    stylua = function()
        null_ls.register(null_ls.builtins.formatting.stylua)
    end,
    jq = function()
        null_ls.register(null_ls.builtins.formatting.jq)
    end,
    hadolint = function()
        null_ls.register(null_ls.builtins.formatting.hadolint)
    end,
    gitlint = function()
        null_ls.register(null_ls.builtins.formatting.gitlint)
    end,
    eslint_d = function()
        null_ls.register(null_ls.builtins.formatting.eslint_d)
    end,
}

null_ls.setup()
