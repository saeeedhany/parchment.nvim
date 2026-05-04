# parchment.nvim

A family of warm, parchment-toned Neovim colorschemes — one package, three variants.

| Variant | Feel |
|---------|------|
| `parchment` | Deep dark — near-black warm browns, aged ink foregrounds |
| `parchment-ember` | Slightly lighter dark — warmer backgrounds, like embers under ash |
| `parchment-manuscript` | Light mode — cream paper backgrounds, sepia ink |

## Installation

**lazy.nvim**
```lua
{
  "saeeedhany/parchment.nvim",
  priority = 1000,
  config = function()
    require("parchment").setup({
      -- all optional, shown with defaults
      terminal_colors = true,
      italic_comments = true,
      italic_strings  = false,
      bold_functions  = false,
      transparent_bg  = false,
      styles          = {},   -- override any highlight group
    })
    vim.cmd("colorscheme parchment")
  end,
}
```

## Switching variants

```vim
:colorscheme parchment
:colorscheme parchment-ember
:colorscheme parchment-manuscript
```

Or in Lua:
```lua
vim.cmd("colorscheme parchment-ember")
```

## Lualine

Automatically picks up whichever variant is active:
```lua
require("lualine").setup({
  options = { theme = require("parchment.lualine") }
})
```

Or pin it to a specific variant:
```lua
require("lualine").setup({
  options = { theme = require("parchment.lualine").get("parchment-manuscript") }
})
```

## Accessing the palette

```lua
-- Active variant
local c = require("parchment").palette()

-- Specific variant
local c = require("parchment").palette("parchment-ember")

-- Example: use in bufferline
require("bufferline").setup({
  highlights = {
    buffer_selected = { fg = c.fg0, bold = true },
    indicator_selected = { fg = c.orange },
  }
})
```

## Config options

| Option | Default | Description |
|--------|---------|-------------|
| `terminal_colors` | `true` | Set `vim.g.terminal_color_*` |
| `italic_comments` | `true` | Italic on comments |
| `italic_strings` | `false` | Italic on strings |
| `bold_functions` | `false` | Bold on functions |
| `transparent_bg` | `false` | Clear Normal background |
| `styles` | `{}` | Override any highlight group |

Example with overrides:
```lua
require("parchment").setup({
  italic_comments = false,
  transparent_bg  = true,
  styles = {
    ["@keyword"] = { fg = "#d4622a", bold = true },
  },
})
```

## File structure

```
parchment.nvim/
├── colors/
│   ├── parchment.lua             -- :colorscheme parchment
│   ├── parchment-ember.lua       -- :colorscheme parchment-ember
│   └── parchment-manuscript.lua  -- :colorscheme parchment-manuscript
└── lua/parchment/
    ├── init.lua       -- setup(), _load(), palette()
    ├── palettes.lua   -- all three palettes
    ├── highlights.lua -- shared highlight groups
    ├── terminal.lua   -- terminal color mappings
    └── lualine.lua    -- lualine theme (all variants)
```

## Supported plugins

Telescope, nvim-cmp, GitSigns, Neo-tree, nvim-tree, Which-key, Trouble,
nvim-notify, Noice, Snacks.nvim, Lazy.nvim, Mason, Navic, Flash, Hop, Leap,
indent-blankline, render-markdown, Lualine, and terminal colors.
