--[[
  parchment lualine theme
  Usage in your lualine config:
    require("lualine").setup({
      options = { theme = require("parchment.lualine") }
    })
--]]

local c = require("parchment").palette()

local parchment = {}

parchment.normal = {
  a = { fg = c.bg1,  bg = c.blue,   gui = "bold" },
  b = { fg = c.fg1,  bg = c.bg2 },
  c = { fg = c.fg2,  bg = c.bg0 },
}

parchment.insert = {
  a = { fg = c.bg1,  bg = c.green,  gui = "bold" },
  b = { fg = c.fg1,  bg = c.bg2 },
  c = { fg = c.fg2,  bg = c.bg0 },
}

parchment.visual = {
  a = { fg = c.bg1,  bg = c.orange, gui = "bold" },
  b = { fg = c.fg1,  bg = c.bg2 },
  c = { fg = c.fg2,  bg = c.bg0 },
}

parchment.replace = {
  a = { fg = c.bg1,  bg = c.red,    gui = "bold" },
  b = { fg = c.fg1,  bg = c.bg2 },
  c = { fg = c.fg2,  bg = c.bg0 },
}

parchment.command = {
  a = { fg = c.bg1,  bg = c.yellow, gui = "bold" },
  b = { fg = c.fg1,  bg = c.bg2 },
  c = { fg = c.fg2,  bg = c.bg0 },
}

parchment.inactive = {
  a = { fg = c.muted, bg = c.bg0 },
  b = { fg = c.muted, bg = c.bg0 },
  c = { fg = c.muted, bg = c.bg0 },
}

parchment.terminal = {
  a = { fg = c.bg1,  bg = c.cyan,   gui = "bold" },
  b = { fg = c.fg1,  bg = c.bg2 },
  c = { fg = c.fg2,  bg = c.bg0 },
}

return parchment
