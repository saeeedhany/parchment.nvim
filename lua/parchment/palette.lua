local M = {}

M.colors = {
  -- Backgrounds (dark warm paper)
  bg0 = "#0f0e0d",   -- deepest bg (statusline, inactive)
  bg1 = "#141312",   -- main editor bg
  bg2 = "#1a1917",   -- float/popup bg
  bg3 = "#201f1d",   -- visual selection, cursorline
  bg4 = "#272522",   -- diff add bg, subtle highlights

  -- Foregrounds (aged parchment ink)
  fg0 = "#d4c9a8",   -- primary text
  fg1 = "#b8ae90",   -- secondary / normal text
  fg2 = "#a89f88",   -- comments, subtle text
  fg3 = "#7a7060",   -- very muted (line numbers, whitespace)

  -- Syntax colors
  red    = "#cc3a3a",  -- errors, deleted, keywords (return/break)
  green  = "#4a9e5c",  -- strings, added
  yellow = "#c8a94a",  -- warnings, types, constants
  blue   = "#3a8fc4",  -- functions, identifiers
  orange = "#d4622a",  -- keywords (if/for/while), special
  cyan   = "#4aa8a1",  -- builtins, methods, includes

  -- UI colors
  muted  = "#4a4640",  -- borders, inactive elements
  border = "#252320",  -- window separators

  -- Derived accent tones (slightly lighter for emphasis)
  red_dim    = "#8f2929",
  green_dim  = "#2e6138",
  yellow_dim = "#7a6630",
  blue_dim   = "#1e5478",
  orange_dim = "#7a3818",
  cyan_dim   = "#276662",

  -- Diff colors
  diff_add    = "#1e3320",
  diff_change = "#2a2516",
  diff_delete = "#331818",
  diff_text   = "#3a3018",

  -- Git signs
  git_add    = "#4a9e5c",
  git_change = "#c8a94a",
  git_delete = "#cc3a3a",

  -- Special
  none = "NONE",
}

return M
