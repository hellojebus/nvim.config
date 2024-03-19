require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		--javascript = { "prettierd" },
		--avascriptreact = { "prettierd" },
		--typescript = { "prettierd" },
		--typescriptreact = { "prettierd" },
	},
	format_on_save = {
		timeout_ms = 250,
		lsp_fallback = true,
	},
})
