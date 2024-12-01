
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    --use { "folke/tokyonight.nvim", as = "tokyonight" , config = function() vim.cmd("colorscheme tokyonight") end}
    use { "rose-pine/neovim", as = "rose-pine" , config = function() vim.cmd("colorscheme rose-pine") end}
   -- use { "catppuccin/nvim", as = "catppuccin" , config = function() vim.cmd("colorscheme catppuccin-macchiato") end}
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use({'VonHeikemen/lsp-zero.nvim'})
    use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
}
    use({'neovim/nvim-lspconfig'})
    use({'williamboman/mason.nvim'})
    use({'williamboman/mason-lspconfig.nvim'})
    -- Autocompletion
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({'hrsh7th/cmp-buffer'})
    use({'hrsh7th/cmp-path'})
    use({'hrsh7th/cmp-cmdline'})
    -- Snippets
    use({'L3MON4D3/LuaSnip'})
    use({'saadparwaiz1/cmp_luasnip'})
       use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    config = function() 
        require("lsp-zero").setup()
        require("mason").setup()
    end
end)
