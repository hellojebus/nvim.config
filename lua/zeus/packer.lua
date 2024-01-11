local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
      vim.fn.system({
          'git',
          'clone',
          "--filter=blob:none",
          'https://github.com/lewis6991/pckr.nvim',
          pckr_path
      })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
  "williamboman/mason.nvim",
  "lewis6991/gitsigns.nvim",
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5', requires = { {'nvim-lua/plenary.nvim'} }
  },
  {
    "conweller/muted.vim",
    config = function ()
      vim.cmd("colorscheme muted")
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
          }
        },
        {
          "max397574/better-escape.nvim",
          config = function()
            require("better_escape").setup()
          end,
        },
        {
          'nvim-lualine/lualine.nvim',
          requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        },
        {
          "lukas-reineke/indent-blankline.nvim",
          config = function()
            require("ibl").setup()
          end
        },
        {
          "echasnovski/mini.pairs"
        },
        {
          "akinsho/toggleterm.nvim",
          tag = "v2.9.0",
          config = function()
            require("toggleterm").setup{
              start_in_insert = true,
            }
          end
        },
      }
