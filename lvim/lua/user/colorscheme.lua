vim.o.background = "dark"

require("onedarkpro").setup({
  dark_theme = "onedark", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  highlights = {
  }, -- Override default highlight groups
  plugins = { -- Override which plugin highlight groups are loaded
    -- See the Supported Plugins section for a list of available plugins
    all = true,
  },
  styles = { -- Choose from "bold,italic,underline"
    strings = "NONE", -- Style that is applied to strings.
    comments = "italic", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    functions = "NONE", -- Style that is applied to functions
    variables = "NONE", -- Style that is applied to variables
    virtual_text = "NONE", -- Style that is applied to virtual text
  },
  options = {
    bold = false, -- Use the colorscheme's opinionated bold styles?
    italic = false, -- Use the colorscheme's opinionated italic styles?
    underline = false, -- Use the colorscheme's opinionated underline styles?
    undercurl = false, -- Use the colorscheme's opinionated undercurl styles?
    cursorline = false, -- Use cursorline highlighting?
    transparency = false, -- Use a transparent background?
    terminal_colors = false, -- Use the colorscheme's colors for Neovim's :terminal?
    window_unfocused_color = false, -- When the window is out of focus, change the normal background?
  }
})
