local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
  vim.notify("Neotree not found")
  return
end
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neo_tree.setup({
  close_if_last_window = true,
  enable_diagnostics = true,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      filesystem = " File",
      buffers = "➜ Buffs",
      git_status = " Git",
      diagnostics = "",
    },
  },
  default_component_configs = {
    indent = {
      padding = 0,
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
    git_status = {
      symbols = {
        added = "",
        deleted = "",
        modified = "",
        renamed = "",
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ["v"] = "open_vsplit",
      ["s"] = "open_split",
      ["h"] = "close_node",
      ["l"] = "open",
    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
})
