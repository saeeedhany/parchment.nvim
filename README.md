# parchment.nvim

A warm, dark Neovim colorscheme built on aged-paper tones — deep brown-blacks,
ochre foregrounds, and earthy syntax accents.

## Palette

| Role         | Hex       | Used for                                |
|--------------|-----------|-----------------------------------------|
| `bg0`        | `#0f0e0d` | Deepest bg (statusline, inactive wins)  |
| `bg1`        | `#141312` | Main editor background                  |
| `bg2`        | `#1a1917` | Float/popup backgrounds                 |
| `fg0`        | `#d4c9a8` | Primary text                            |
| `fg1`        | `#b8ae90` | Secondary text / normal                 |
| `fg2`        | `#a89f88` | Comments, subtle text                   |
| `red`        | `#cc3a3a` | Errors, exceptions, `return`/`break`    |
| `green`      | `#4a9e5c` | Strings, added (diff/git)               |
| `yellow`     | `#c8a94a` | Types, warnings, constants              |
| `blue`       | `#3a8fc4` | Functions, identifiers                  |
| `orange`     | `#d4622a` | Keywords (`if`/`for`/`while`), special  |
| `cyan`       | `#4aa8a1` | Builtins, methods, includes             |
| `muted`      | `#4a4640` | Borders, inactive elements              |
| `border`     | `#252320` | Window separators                       |

## Installation

**lazy.nvim**
```lua
{
  "saeeedhany/parchment.nvim",
  priority = 1000,
  config = function()
    require("parchment").setup({
      -- options (all optional, shown with defaults)
      terminal_colors = true,   -- set vim.g.terminal_color_*
      italic_comments = true,
      italic_strings  = false,
      bold_functions  = false,
      transparent_bg  = false,
      styles = {},              -- override specific highlight groups
    })
    vim.cmd("colorscheme parchment")
  end,
}
```

**packer.nvim**
```lua
use {
  "saeeedhany/parchment.nvim",
  config = function()
    require("parchment").setup({})
    vim.cmd("colorscheme parchment")
  end
}
```

**vim-plug**
```vim
Plug 'saeeedhany/parchment.nvim'
" then in your init.lua:
" require("parchment").setup({})
" vim.cmd("colorscheme parchment")
```

## Usage

```lua
-- Minimal
vim.cmd("colorscheme parchment")

-- With options
require("parchment").setup({
  transparent_bg  = true,
  italic_comments = false,
  bold_functions  = true,
  styles = {
    -- Override any highlight group directly
    ["@keyword"] = { fg = "#d4622a", bold = true },
  },
})
vim.cmd("colorscheme parchment")
```

## Lualine

```lua
require("lualine").setup({
  options = {
    theme = require("parchment.lualine"),
  }
})
```

## Accessing the palette

Other plugins (bufferline, heirline, etc.) can consume the palette directly:

```lua
local c = require("parchment").palette()
-- c.blue, c.orange, c.bg1, etc.
```

## Supported plugins

- **Treesitter** — full `@` namespace
- **LSP** — diagnostics, semantic tokens, inlay hints, code lens
- **nvim-cmp** — all `CmpItemKind*` groups
- **Telescope**
- **Neo-tree / nvim-tree**
- **GitSigns**
- **Which-key**
- **Trouble**
- **nvim-notify**
- **Noice / Snacks.nvim**
- **Lazy.nvim**
- **Mason**
- **Navic**
- **Flash / Hop / Leap**
- **indent-blankline**
- **render-markdown.nvim**
- **Lualine** (via `parchment.lualine`)
- Terminal colors (`vim.g.terminal_color_*`)

## File structure

```
parchment.nvim/
├── colors/
│   └── parchment.lua        -- colorscheme entry point
└── lua/parchment/
    ├── init.lua             -- setup(), load(), palette()
    ├── palette.lua          -- all color values
    ├── highlights.lua       -- all highlight group definitions
    ├── terminal.lua         -- terminal_color_* mappings
    └── lualine.lua          -- lualine theme
```
