local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config=true,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        }
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build =":TSUpdate",
        lazy = false,
    },
    {
        "nvimdev/guard.nvim",
        -- Builtin configuration, optional
        dependencies = {
            "nvimdev/guard-collection",
        },
    },
    'mbbill/undotree',
    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    -- Autocomplete
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- Snippets
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    "dcampos/nvim-snippy",
    'rafamadriz/friendly-snippets',
    -- Web Dev
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    -- Colorschemes
    "slugbyte/lackluster.nvim",
})

