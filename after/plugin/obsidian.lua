require("obsidian").setup({
	workspaces = {
		{
			name = "tresio",
			path = "~/Documents/Obsidian Vault/tresio",
		},
		{
			name = "personal",
			path = "~/Documents/Obsidian Vault/personal",
		},
	},
	mappings = {
		-- Toggle check-boxes.
		["<leader>oc"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},
})
