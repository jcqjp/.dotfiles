local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 12
config.font = wezterm.font("MesloLGS Nerd Font")

config.hide_tab_bar_if_only_one_tab = true
--config.window_decorations = "RESIZE"

config.colors = {
  -- Éléments principaux
  foreground = "#DCDCDC",
  background = "#14191E",

  -- Curseur
  cursor_bg   = "#FFFFFF",
  cursor_fg   = "#000000",
  cursor_border = "#FFFFFF",  -- optionnel, même couleur que cursor_bg

  -- Sélection
  selection_bg = "#B3D7FF",
  selection_fg = "#000000",

  -- ANSI (16 couleurs standards, index 0..15)
  ansi = {
    "#14191E",  -- 0  black
    "#B43C2A",  -- 1  red
    "#00C200",  -- 2  green
    "#C7C400",  -- 3  yellow
    "#2744C7",  -- 4  blue
    "#C040BE",  -- 5  magenta
    "#00C5C7",  -- 6  cyan
    "#C7C7C7",  -- 7  white
  },

  brights = {
    "#686868",  -- 8  bright black
    "#DD7975",  -- 9  bright red
    "#58E790",  -- 10 bright green
    "#ECE100",  -- 11 bright yellow
    "#A7ABF2",  -- 12 bright blue
    "#E17EE1",  -- 13 bright magenta
    "#60FDFF",  -- 14 bright cyan
    "#FFFFFF",  -- 15 bright white
  },
}

config.color_scheme = "Custom Dark"

config.initial_cols = 120
config.initial_rows = 50

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
