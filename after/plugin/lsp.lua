local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	-- lsp_zero.buffer_autoformat()
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "lua_ls", "html", "cssls", "jsonls", "gopls", "emmet_ls" },
	handlers = {
		lsp_zero.default_setup,
	},
})

require("lspconfig").tsserver.setup({
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "project-relative",
		},
	},
	on_attach = function(client, bufnr)
		--client.resolved_capabilities.document_formatting = false
		--client.resolved_capabilities.document_range_formatting = false

		-- Setup typescript-tools within tsserver on_attach
		--local ts_utils = require("typescript-tools.utils")
		--ts_utils.setup_client(client)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
	end,
})

require("lspconfig").cssmodules_ls.setup({
	on_attach = function(client)
		client.server_capabilities.definitionProvider = false
		--custom_on_attach(client)
	end,
})

require("lspconfig").eslint.setup({
	settings = {
		workingDirectories = { mode = "auto" },
		packageManager = "npm",
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
		-- Set a buffer variable to indicate that the autocmd is set
		vim.api.nvim_buf_set_var(bufnr, "eslint_fix_all_set", true)
	end,
})
require("lspconfig").gopls.setup({})

local cmp = require("cmp")

local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	-- sources = {
	-- { name = "nvim_lsp_signature_help" },
	-- },
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}),
})
