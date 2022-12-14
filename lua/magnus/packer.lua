local packerPath = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packerPath)) == 1 then
  vim.fn.system("git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. packerPath)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require("packer")

packer.startup {
  function(use)
    use 'wbthomason/packer.nvim'

-- RANDOMS {{{
    use {'mickael-menu/zk-nvim',
      config = function ()
        require("zk").setup()
      end
    }
    use 'lewis6991/impatient.nvim'
    use 'echasnovski/mini.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'karb94/neoscroll.nvim'
    use 'j-hui/fidget.nvim'
    use 'xiyaowong/nvim-transparent'
    use 'lervag/wiki.vim'
    use 'mg979/vim-visual-multi'
    use 'nvim-treesitter/playground'
    use 'LunarVim/darkplus.nvim'
    use 'navarasu/onedark.nvim'
    use 'bluz71/vim-moonfly-colors'
    use 'ntk148v/komau.vim'
    use 'rafamadriz/friendly-snippets'
    use { "Pocco81/true-zen.nvim",
      config = function()
        require("magnus.plugins.truezen")
      end,
    }
    use { 'andweeb/presence.nvim',
      config = function()
        require('magnus.plugins.presence')
      end
    }
--}}}

-- Themes {{{
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'projekt0n/github-nvim-theme'
    use { 'Everblush/everblush.nvim', as = 'everblush' }
    use 'w3barsi/barstrata.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'ray-x/aurora'
    use 'Domeee/mosel.nvim'
    use 'rose-pine/neovim'
    use 'embark-theme/vim'
    use 'rebelot/kanagawa.nvim'
    use 'rakr/vim-one'
    use 'sainnhe/everforest'
    use 'sam4llis/nvim-tundra'
    use 'wuelnerdotexe/vim-enfocado'
--}}}

-- Ui {{{
    use { 'SmiteshP/nvim-navic',
      config = function()
        require("magnus.plugins.navic")
      end
    }
    use { 'folke/todo-comments.nvim',
      config = function()
        require("magnus.plugins.todo")
      end
    }
    use { 'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('magnus.plugins.lines')
      end
    }
    use { 'rcarriga/nvim-notify',
      config = function()
        require("magnus.plugins.notify")
      end
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      tag = 'nightly',
      config = function()
        require('magnus.plugins.nvim-tree')
      end,
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = {
        { 'kyazdani42/nvim-web-devicons', opt = true },
      },
      config = function()
        require('magnus.plugins.lualine')
      end,
    }
    use({ "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    })
--}}}

-- Utils {{{
    use 'christoomey/vim-tmux-navigator'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'tpope/vim-commentary'
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('magnus.plugins.autopairs')
      end,
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = { 'p00f/nvim-ts-rainbow',
        use 'David-Kunz/markid'
      },
      run = ':TSUpdate',
      config = function()
        require('magnus.plugins.treesitter')
      end,
    }
    use { 'norcalli/nvim-colorizer.lua',
      config = function()
        require('magnus.plugins.colorizer')
      end
    }
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('magnus.plugins.comment')
      end
    }
    use { 'folke/which-key.nvim',
      config = function()
        require("magnus.plugins.whichkey")
      end
    }
    -- use { 'phaazon/hop.nvim',
    --   config = function()
    --     require("magnus.plugins.hop")
    --   end
    -- }
    use { 'rmagatti/auto-session',
      config = function()
        require("magnus.plugins.aSession")
      end
    }
    use { 'ziontee113/color-picker.nvim',
      config = function()
        require("magnus.plugins.colorPicker")
      end
    }
    use { 'goolord/alpha-nvim',
      config = function()
        require("magnus.plugins.alpha")
      end
    }
    use { 'akinsho/toggleterm.nvim',
      config = function()
        require("magnus.plugins.terminal")
      end
    }
    -- File Search
    use { 'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim'
      },
      config = function()
        require('magnus.plugins.telescope')
      end
    }
--}}}

-- Debug {{{
    use { 'mfussenegger/nvim-dap',
      requires = { 'rcarriga/nvim-dap-ui' },
      config = function()
        require("magnus.plugins.dap")
      end
    }
    use 'mfussenegger/nvim-jdtls'
--}}}

-- GitHub {{{
    -- use { 'lewis6991/gitsigns.nvim',
    --   config = function()
    --     require('magnus.plugins.gitsigns')
    --   end
    -- }
--}}}

-- Autocomplete and lsp {{{
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require("magnus.plugins.cmp")
      end,
    }
    use "amarakon/nvim-cmp-fonts"
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'jose-elias-alvarez/null-ls.nvim'
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    -- }}}

-- En proceso {{{
    use { 'TroubleC0re/core.nvim',
      config = function()
        require("magnus.plugins.core")
      end
    }
--}}}

  end,
  config = {
    --compile_path = vim.fn.stdpath('config') .. '/lua/magnus.packerC/packerComp.lua',
    display = {
      open_fn = require('packer.util').float,
    },
  },
}
