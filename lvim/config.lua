--[[
lvim is the global options object

linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.active = false
lvim.lsp.diagnostics.virtual_text = true
lvim.builtin.terminal.active = true
lvim.builtin.breadcrumbs.active = true


vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.o.guifont = "FiraCode Nerd Font Mono: h16"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  b = { "<cmd>SymbolsOutline<cr>", "Symbols" },
}

lvim.builtin.which_key.mappings["H"] = {
  name = "+Harpoon",
  t = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle" },
  m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "mark" },
}

lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" }

lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle<cr>", "Explorer" }

lvim.builtin.which_key.mappings["d"] = {
  name = "Debug",
  b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
  O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
  l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
  u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
}

lvim.builtin.which_key.mappings["j"] = {
  name = "Jump",
  w = {"<cmd> lua require'hop'.hint_words({ current_line_only = true })<cr>", "find-word-inline"},
  j = {"<cmd> lua require'hop'.hint_lines_skip_whitespace({direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>", "line-below-start"},
  k = {"<cmd> lua require'hop'.hint_lines_skip_whitespace({direction = require'hop.hint'.HintDirection.BEFORE_CURSOR})<cr>", "line-above-start"},
  s = {"<cmd> lua require'hop'.hint_patterns()<cr>", "pattern-search"},
  u = {"<cmd> lua require'hop'.hint_char1()<cr>", "unigram-search"},
  b = {"<cmd> lua require'hop'.hint_char2()<cr>", "bigram-search" }
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "cpp",
  "zig"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    -- "sumeko_lua",
    "jsonls",
    "rust_analyzer",
    "marksman",
    "clangd",
    "pyright",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("zls", {})
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "purescriptls" })

require("lvim.lsp.manager").setup("marksman", {})
require("lvim.lsp.manager").setup("sqls", {})
require("lvim.lsp.manager").setup("purescriptls", {
  settings = {
    purescript = {
      addSpagoSources = true -- e.g. any purescript language-server config here
    }
  },
  flags = {
    debounce_text_changes = 150,
  }
})



-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "npxbr/glow.nvim",
  },
  {
    "phaazon/hop.nvim",
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "simrat39/rust-tools.nvim",
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup()
    end
  },
  {
    'saecki/crates.nvim',
    config = function()
      require("crates").setup()
    end
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup()
    end
  },
  {
    "is0n/jaq-nvim",
  },
  {
    "tzachar/cmp-tabnine",
    run='./install.sh',

    config = function()
      require('cmp_tabnine.config').setup({
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = '..',
        ignored_file_types = {},
        show_prediction_strength = false
      })
    end
  },
  {
    "xiyaowong/nvim-transparent",

    config = function()
      require("transparent").setup({
        enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be cleared
          -- In particular, when you set it to 'all', that means all available groups
          "all"
        },
        exclude = {}, -- table: groups you don't want to clear
      })
    end
  },
  {
    "TimUntersberger/neogit",
    config = function ()
      require("neogit").setup()
    end
  },
  {
    "ziglang/zig.vim",
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function ()
      require("catppuccin").setup {
        flavour = "frappe"
      }
    end
  },
  {
    "ThePrimeagen/harpoon",
  },
  {
    "purescript-contrib/purescript-vim",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
		requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
		setup = function()
			vim.g.neo_tree_remove_legacy_commands = true
		end,
		config = function()
			require("user.neo-tree")
		end,
	},
}

require("user.rust-tools")
require("user.colorscheme")
-- require("user.dap-ui")
require("user.hop")
require("user.jaq")

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
