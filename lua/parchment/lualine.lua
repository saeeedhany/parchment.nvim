-- lua/parchment/lualine.lua
-- Supports all three variants. Auto-detects the active one,
-- or call .get("parchment-ember") for a specific variant.

local M = {}

local function build(c)
  return {
    normal   = { a = { fg = c.bg1, bg = c.blue,   gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    insert   = { a = { fg = c.bg1, bg = c.green,  gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    visual   = { a = { fg = c.bg1, bg = c.orange, gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    replace  = { a = { fg = c.bg1, bg = c.red,    gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    command  = { a = { fg = c.bg1, bg = c.yellow, gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    terminal = { a = { fg = c.bg1, bg = c.cyan,   gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    inactive = { a = { fg = c.muted, bg = c.bg0 }, b = { fg = c.muted, bg = c.bg0 }, c = { fg = c.muted, bg = c.bg0 } },
  }
end

-- Get theme for a specific variant
---@param variant? string defaults to active colorscheme
function M.get(variant)
  local c = require("parchment").palette(variant)
  return build(c)
end

-- Make the module itself usable as a lualine theme directly:
--   options = { theme = require("parchment.lualine") }
-- Uses whichever parchment variant is currently active.
return setmetatable(M, {
  __index = function(_, key)
    local c = require("parchment").palette()
    return build(c)[key]
  end,
})
