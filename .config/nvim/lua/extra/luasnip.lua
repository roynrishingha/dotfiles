local luasnip_avail, luasnip = pcall(require, "luasnip")
local loader_avail, loader = pcall(require, "luasnip/loaders/from_vscode")
if not (luasnip_avail and loader_avail) then return end

loader.lazy_load()

if type(luasnip.filetype_extend) == "table" then
    for filetype, snippets in pairs(luasnip.filetype_extend) do
        luasnip.filetype_extend(filetype, snippets)
    end
end
