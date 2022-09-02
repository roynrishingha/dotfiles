local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

local colors = {
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67'
}

local filetype = {
    "filetype",
    icons_enabled = true,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local location = {
    "location",
    padding = 0,
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = "ﮊ ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local config = {
    options = {
        icons_enabled = true,
        theme = 'everforest',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { branch, 'filename' },
        lualine_c = { 'lsp_progress' },
        lualine_x = { filetype, diagnostics },
        lualine_y = { 'encoding' },
        lualine_z = { 'fileformat', location }
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

ins_left {
    'lsp_progress',
    colors = {
        percentage      = colors.cyan,
        title           = colors.cyan,
        message         = colors.cyan,
        spinner         = colors.cyan,
        lsp_client_name = colors.magenta,
        use             = true,
    },
    separators = {
        component = ' ',
        progress = ' | ',
        -- message = { pre = '(', post = ')' },
        percentage = { pre = '', post = '%% ' },
        title = { pre = '', post = ': ' },
        lsp_client_name = { pre = '[', post = ']' },
        spinner = { pre = '', post = '' },
        message = { commenced = 'In Progress', completed = 'Completed' },
    },
    display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
    timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
    spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
}

lualine.setup(config)
