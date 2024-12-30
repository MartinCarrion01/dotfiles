vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use("folke/tokyonight.nvim")

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use "olimorris/onedarkpro.nvim"

  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ":TSUpdate" },
  }
  use('nvim-lua/plenary.nvim')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    'neovim/nvim-lspconfig',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/vim-vsnip' }
    }
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
  use('tpope/vim-rails')
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
end)
