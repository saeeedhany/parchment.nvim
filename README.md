# parchment.nvim

> A family of warm, parchment-toned colorschemes for Neovim.
> One plugin. Three variants. Built on aged-paper aesthetics.

---

<!--
  SCREENSHOTS
  Once you have screenshots, replace this block with actual images.
  Recommended size: 1200x700px per variant.

  ![parchment](./assets/parchment.png)
  ![parchment-ember](./assets/parchment-ember.png)
  ![parchment-manuscript](./assets/parchment-manuscript.png)
-->

```
[ parchment ]                    [ parchment-ember ]               [ parchment-manuscript ]
  deep dark · warm browns          slightly lighter · ember tones    light · cream paper · sepia
```

---

## Variants

| Name | Background | Feel |
|---|---|---|
| `parchment` | dark | Near-black warm browns, aged ink |
| `parchment-ember` | dark | A touch lighter and warmer, like embers under ash |
| `parchment-manuscript` | light | Cream paper, sepia ink, candlelit warmth |

---

## Palette

```
  bg0   #0f0e0d       fg0   #d4c9a8       red      #cc3a3a
  bg1   #141312       fg1   #b8ae90       green    #4a9e5c
  bg2   #1a1917       fg2   #a89f88       yellow   #c8a94a
                      fg3   #7a7060       blue     #3a8fc4
                                          orange   #d4622a
                                          cyan     #4aa8a1
```

---

## Installation

**lazy.nvim**

```lua
{
  "saeeedhany/parchment.nvim",
  priority = 1000,
  config = function()
    require("parchment").setup({})
    vim.cmd("colorscheme parchment")
  end,
}
```

**packer**

```lua
use {
  "saeeedhany/parchment.nvim",
  config = function()
    require("parchment").setup({})
    vim.cmd("colorscheme parchment")
  end,
}
```

---

## Switching Variants

```lua
vim.cmd("colorscheme parchment")             -- deep dark
vim.cmd("colorscheme parchment-ember")       -- lighter dark
vim.cmd("colorscheme parchment-manuscript")  -- light mode
```

---

## Configuration

All options are optional. These are the defaults:

```lua
require("parchment").setup({
  terminal_colors = true,   -- set vim.g.terminal_color_*
  italic_comments = true,
  italic_strings  = false,
  bold_functions  = false,
  transparent_bg  = false,
  styles          = {},     -- override any highlight group directly
})
```

**Example with overrides:**

```lua
require("parchment").setup({
  italic_comments = false,
  transparent_bg  = true,
  styles = {
    ["@keyword"] = { fg = "#d4622a", bold = true },
  },
})
```

---

## Lualine

Automatically adapts to whichever variant is active:

```lua
require("lualine").setup({
  options = { theme = require("parchment.lualine") },
})
```

Pin to a specific variant regardless of active colorscheme:

```lua
require("lualine").setup({
  options = {
    theme = require("parchment.lualine").get("parchment-manuscript"),
  },
})
```

---

## Using the Palette

Access colors directly for use in other plugins:

```lua
-- active variant
local c = require("parchment").palette()

-- specific variant
local c = require("parchment").palette("parchment-ember")

-- example: bufferline
require("bufferline").setup({
  highlights = {
    buffer_selected    = { fg = c.fg0, bold = true },
    indicator_selected = { fg = c.orange },
  },
})
```

---

## Plugin Support

```
Core              Completion        Git               Navigation
────────────────  ────────────────  ────────────────  ────────────────
Treesitter        nvim-cmp          GitSigns          Telescope
LSP diagnostics   Lualine           Diff highlights   Flash / Hop / Leap
Semantic tokens   Which-key         Neo-tree          Navic
Inlay hints       Trouble           nvim-tree
Terminal colors   nvim-notify
                  Lazy.nvim
                  Mason
                  Snacks.nvim
                  indent-blankline
                  render-markdown
```

---

## Structure

```
parchment.nvim/
├── colors/
│   ├── parchment.lua
│   ├── parchment-ember.lua
│   └── parchment-manuscript.lua
└── lua/parchment/
    ├── init.lua          setup(), _load(), palette()
    ├── palettes.lua      all three color palettes
    ├── highlights.lua    shared highlight definitions
    ├── terminal.lua      terminal color mappings
    └── lualine.lua       lualine theme (all variants)
```

---

## License

MIT
