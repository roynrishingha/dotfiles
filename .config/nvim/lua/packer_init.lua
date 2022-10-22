local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install plugins
packer.startup(function(use)
    -- plugin manager
    use 'wbthomason/packer.nvim'

    -- theme
    use 'sainnhe/everforest'

    -- Chaching
    use 'lewis6991/impatient.nvim'

    -- Notification manager
    use 'rcarriga/nvim-notify'

    -- Neovim UI Enhancer
    use 'stevearc/dressing.nvim'

    -- vscode like LSP pictogram
    use 'onsails/lspkind.nvim'

    -- Bufferline
    use 'akinsho/bufferline.nvim'

    -- Better buffer closing
    use 'famiu/bufdelete.nvim'

    use {
        's1n7ax/nvim-window-picker',
        tag = 'v1.*',
        config = function()
            require 'window-picker'.setup()
        end,
    }

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'arkav/lualine-lsp-progress'


    -- File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }

    -- Syntax  highlighting
    use 'nvim-treesitter/nvim-treesitter'

    -- Snippet collection
    use 'rafamadriz/friendly-snippets'

    -- Snippet engine
    use 'L3MON4D3/LuaSnip'

    -- Completion engine
    use 'hrsh7th/nvim-cmp'

    -- Snippet completion source
    use 'saadparwaiz1/cmp_luasnip'

    -- Buffer completion source
    use 'hrsh7th/cmp-buffer'

    -- Path completion source
    use 'hrsh7th/cmp-path'

    -- LSP completion source
    use 'hrsh7th/cmp-nvim-lsp'

    -- Built-in LSP
    use 'neovim/nvim-lspconfig'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    -- LSP symbols
    use 'stevearc/aerial.nvim'

    -- Fuzzy finder
    use 'nvim-telescope/telescope.nvim'

    -- Fuzzy finder syntax support
    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    }

    -- Formatting and linting
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- null-ls manager
    use 'jayp0521/mason-null-ls.nvim'

    -- Git integration
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Indentation
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- start screen
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- Keymaps popup
    use 'folke/which-key.nvim'

    -- Code window
    use {
        'gorbit99/codewindow.nvim',
        config = function()
            local codewindow = require('codewindow')
            codewindow.setup()
            codewindow.apply_default_keybinds()
        end,
    }


    if packer_bootstrap then
        require('packer').sync()
    end
end)
