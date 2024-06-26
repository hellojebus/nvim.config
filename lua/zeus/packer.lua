local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not vim.loop.fs_stat(pckr_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/lewis6991/pckr.nvim",
			pckr_path,
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require("pckr").add({
	"williamboman/mason.nvim",
	"lewis6991/gitsigns.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"jvgrootveld/telescope-zoxide",
	},
	{
		"ribru17/bamboo.nvim",
		config = function()
			vim.cmd("colorscheme bamboo")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			-- { "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "L3MON4D3/LuaSnip" },
		},
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
	},
	{
		"akinsho/toggleterm.nvim",
		tag = "v2.9.0",
		config = function()
			require("toggleterm").setup({
				start_in_insert = true,
			})
		end,
	},
	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				close_on_select = true,
				default_direction = "left",
			})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"gbrlsnchs/telescope-lsp-handlers.nvim",
	},
	{
		"stevearc/conform.nvim",
	},
	{
		"ray-x/go.nvim",
		config = function()
			require("go").setup()
		end,
	},
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"epwalsh/obsidian.nvim",
		tag = "v3.7.3", -- recommended, use latest release instead of latest commit
		requires = {
			"nvim-lua/plenary.nvim",
		},
		after = "hrsh7th/nvim-cmp",
	},
	{
		"pmizio/typescript-tools.nvim",
		config = function()
			--require("typescript-tools").setup({})
		end,
	},
	{
		"github/copilot.vim",
	},
})
