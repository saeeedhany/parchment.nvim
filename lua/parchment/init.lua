--[[
  parchment.nvim
  A family of warm, parchment-toned colorschemes.

  Variants:
    parchment            — original deep dark (near-black warm browns)
    parchment-ember      — slightly lighter/warmer dark (like embers under ash)
    parchment-manuscript — light mode (cream paper, sepia ink)

  Usage:
    vim.cmd("colorscheme parchment")
    vim.cmd("colorscheme parchment-ember")
    vim.cmd("colorscheme parchment-manuscript")

  Optional config (call before loading colorscheme):
    require("parchment").setup({
      terminal_colors = true,
      italic_comments = true,
      italic_strings  = false,
      bold_functions  = false,
      transparent_bg  = false,
      styles          = {},
    })

  Lualine:
    require("lualine").setup({
      options = { theme = require("parchment.lualine") }
    })
    -- or for a specific variant:
    require("lualine").setup({
      options = { theme = require("parchment.lualine").get("parchment-ember") }
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

-- Internal loader — called by each colors/*.lua file
---@param variant string  e.g. "parchment", "parchment-ember", "parchment-manuscript"
function M._load(variant)
  local palettes   = require("parchment.palettes")
  local highlights = require("parchment.highlights")
  local terminal   = require("parchment.terminal")

  local c = palettes[variant]
  if not c then
    vim.notify(
      string.format("[parchment.nvim] Unknown variant '%s'", variant),
      vim.log.levels.ERROR
    )
    return
  end

  -- Deep-copy so transparent_bg doesn't mutate the shared palette table
  c = vim.deepcopy(c)

  if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
  end

  -- manuscript is light, everything else is dark
  vim.opt.background = (variant == "parchment-manuscript") and "light" or "dark"
  vim.g.colors_name  = variant

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  if M.config.transparent_bg then
    c.bg1 = "NONE"
  end

  highlights.apply(c)

  if M.config.terminal_colors then
    terminal.apply(c)
  end

  for group, style in pairs(M.config.styles) do
    vim.api.nvim_set_hl(0, group, style)
  end

  if not M.config.italic_comments then
    vim.api.nvim_set_hl(0, "Comment",  { fg = c.fg2 })
    vim.api.nvim_set_hl(0, "@comment", { fg = c.fg2 })
  end

  if M.config.italic_strings then
    vim.api.nvim_set_hl(0, "String",  { fg = c.green, italic = true })
    vim.api.nvim_set_hl(0, "@string", { fg = c.green, italic = true })
  end

  if M.config.bold_functions then
    vim.api.nvim_set_hl(0, "Function",  { fg = c.blue, bold = true })
    vim.api.nvim_set_hl(0, "@function", { fg = c.blue, bold = true })
  end
end

-- Convenience: return palette for a variant (defaults to active colorscheme)
---@param variant? string
function M.palette(variant)
  variant = variant or vim.g.colors_name or "parchment"
  return require("parchment.palettes")[variant]
end

return M
