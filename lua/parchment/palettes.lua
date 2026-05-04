-- lua/parchment/palettes.lua
-- All three parchment variant palettes live here.
-- The highlights module is shared across all of them.

local M = {}

-- ─── parchment (original dark) ───────────────────────────────────────────────
M.parchment = {
  bg0 = "#0f0e0d",
  bg1 = "#141312",
  bg2 = "#1a1917",
  bg3 = "#242120",   -- cursorline: just a subtle lift from bg1
  bg4 = "#272522",
  visual = "#4a3f2f", -- visual selection: warm brown, clearly heavier than cursorline

  fg0 = "#d4c9a8",
  fg1 = "#b8ae90",
  fg2 = "#a89f88",
  fg3 = "#7a7060",

  red    = "#cc3a3a",
  green  = "#4a9e5c",
  yellow = "#c8a94a",
  blue   = "#3a8fc4",
  orange = "#d4622a",
  cyan   = "#4aa8a1",

  muted  = "#4a4640",
  border = "#252320",

  red_dim    = "#8f2929",
  green_dim  = "#2e6138",
  yellow_dim = "#7a6630",
  blue_dim   = "#1e5478",
  orange_dim = "#7a3818",
  cyan_dim   = "#276662",

  diff_add    = "#1e3320",
  diff_change = "#2a2516",
  diff_delete = "#331818",
  diff_text   = "#3a3018",

  git_add    = "#4a9e5c",
  git_change = "#c8a94a",
  git_delete = "#cc3a3a",

  none = "NONE",
}

-- ─── parchment-ember (lighter warm dark) ─────────────────────────────────────
M["parchment-ember"] = {
  bg0 = "#16120f",
  bg1 = "#1c1714",
  bg2 = "#231e1a",
  bg3 = "#2c2620",   -- cursorline: subtle warm lift
  bg4 = "#302a22",
  visual = "#503e28", -- visual selection: noticeably richer amber-brown

  fg0 = "#ddd0ac",
  fg1 = "#c2b894",
  fg2 = "#a89f88",
  fg3 = "#7a7060",

  red    = "#cc3a3a",
  green  = "#4a9e5c",
  yellow = "#c8a94a",
  blue   = "#3a8fc4",
  orange = "#d4622a",
  cyan   = "#4aa8a1",

  muted  = "#52493f",
  border = "#2e2822",

  red_dim    = "#8f2929",
  green_dim  = "#2e6138",
  yellow_dim = "#7a6630",
  blue_dim   = "#1e5478",
  orange_dim = "#7a3818",
  cyan_dim   = "#276662",

  diff_add    = "#1e3320",
  diff_change = "#2a2516",
  diff_delete = "#331818",
  diff_text   = "#3a3018",

  git_add    = "#4a9e5c",
  git_change = "#c8a94a",
  git_delete = "#cc3a3a",

  none = "NONE",
}

-- ─── parchment-manuscript (warm paper light mode) ────────────────────────────
M["parchment-manuscript"] = {
  bg0 = "#f5edd8",
  bg1 = "#ede4cc",
  bg2 = "#e4d9bc",
  bg3 = "#ddd0b0",   -- cursorline: just a gentle shade darker than bg1
  bg4 = "#cfc398",
  visual = "#b8a870", -- visual selection: warm golden-tan, clearly distinct, fg0 still readable on it

  fg0 = "#2a2018",
  fg1 = "#3d2f20",
  fg2 = "#5c4a30",
  fg3 = "#8a7050",

  red    = "#a82020",
  green  = "#2e7040",
  yellow = "#8a6818",
  blue   = "#1e5f90",
  orange = "#a03a10",
  cyan   = "#1e706a",

  muted  = "#b0a080",
  border = "#c8ba98",

  red_dim    = "#c84040",
  green_dim  = "#3a8a50",
  yellow_dim = "#a07820",
  blue_dim   = "#2a70a8",
  orange_dim = "#b84820",
  cyan_dim   = "#208880",

  diff_add    = "#cfe8d0",
  diff_change = "#e8e0c0",
  diff_delete = "#e8c8c8",
  diff_text   = "#e0d8a8",

  git_add    = "#2e7040",
  git_change = "#8a6818",
  git_delete = "#a82020",

  none = "NONE",
}

return M
