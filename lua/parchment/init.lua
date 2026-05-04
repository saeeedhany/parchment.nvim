--[[
  parchment.nvim
  A warm, dark colorscheme built on aged-paper tones.

  Usage:
    vim.cmd("colorscheme parchment")

  Optional config (call before loading colorscheme):
    require("parchment").setup({
      terminal_colors = true,   -- set vim.g.terminal_color_*
      italic_comments = true,   -- italic on Comment/@comment
      italic_strings  = false,  -- italic on strings
      bold_functions  = false,  -- bold on Function/@function
      transparent_bg  = false,  -- clear Normal bg (for transparent terminals)
      styles = {
        -- override any group style, e.g. comments = { italic = false }
      },
    })
--]]

local M = {}

---@class ParchmentConfig
---@field terminal_colors boolean
---@field italic_comments  boolean
---@field italic_strings   boolean
---@field bold_functions   boolean
---@field transparent_bg   boolean
---@field styles           table<string, table>

---@type ParchmentConfig
M.config = {
  terminal_colors = true,
  italic_comments = true,
  italic_strings  = false,
  bold_functions  = false,
  transparent_bg  = false,
  styles          = {},
}

---@param opts? ParchmentConfig
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  local palette    = require("parchment.palette")
  local highlights = require("parchment.highlights")
  local terminal   = require("parchment.terminal")

  local c = palette.colors

  -- Validate we have a real GUI capable terminal
  if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
  end

  vim.opt.background = "dark"
  vim.g.colors_name  = "parchment"

  -- Clear any existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Apply style overrides to palette before passing it around
  if M.config.transparent_bg then
    c.bg1 = "NONE"
  end

  highlights.apply(c)

  if M.config.terminal_colors then
    terminal.apply(c)
  end

  -- Post-process user style overrides from config.styles
  for group, style in pairs(M.config.styles) do
    vim.api.nvim_set_hl(0, group, style)
  end

  -- Italic / bold toggles for the most common asks
  if not M.config.italic_comments then
    vim.api.nvim_set_hl(0, "Comment",  { fg = c.fg2 })
    vim.api.nvim_set_hl(0, "@comment", { fg = c.fg2 })
  end

  if M.config.italic_strings then
    vim.api.nvim_set_hl(0, "String",   { fg = c.green, italic = true })
    vim.api.nvim_set_hl(0, "@string",  { fg = c.green, italic = true })
  end

  if M.config.bold_functions then
    vim.api.nvim_set_hl(0, "Function",   { fg = c.blue, bold = true })
    vim.api.nvim_set_hl(0, "@function",  { fg = c.blue, bold = true })
  end
end

-- Convenience: return the palette for use in e.g. lualine configs
function M.palette()
  return require("parchment.palette").colors
end

return M
