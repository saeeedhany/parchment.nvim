local M = {}

function M.apply(c)
  -- Map the 16 ANSI terminal colors to our palette.
  -- These affect :terminal buffers and any plugin that respects them.
  vim.g.terminal_color_0  = c.bg0       -- black
  vim.g.terminal_color_1  = c.red       -- red
  vim.g.terminal_color_2  = c.green     -- green
  vim.g.terminal_color_3  = c.yellow    -- yellow
  vim.g.terminal_color_4  = c.blue      -- blue
  vim.g.terminal_color_5  = c.orange    -- magenta (using orange for warmth)
  vim.g.terminal_color_6  = c.cyan      -- cyan
  vim.g.terminal_color_7  = c.fg1       -- white
  vim.g.terminal_color_8  = c.muted     -- bright black (dark gray)
  vim.g.terminal_color_9  = c.red       -- bright red
  vim.g.terminal_color_10 = c.green     -- bright green
  vim.g.terminal_color_11 = c.yellow    -- bright yellow
  vim.g.terminal_color_12 = c.blue      -- bright blue
  vim.g.terminal_color_13 = c.orange    -- bright magenta
  vim.g.terminal_color_14 = c.cyan      -- bright cyan
  vim.g.terminal_color_15 = c.fg0       -- bright white
end

return M
