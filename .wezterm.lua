local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 12
config.font = wezterm.font("MesloLGSDZ Nerd Font")

config.hide_tab_bar_if_only_one_tab = true
--config.window_decorations = "RESIZE"

config.colors = {
  background = '#0f0f12', -- background-color
  foreground = '#aaaaaa', -- foreground-color

  -- Palette ANSI (16 couleurs)
  ansi = {
    '#171421', -- noir   (index 0)
    '#c01c28', -- rouge  (1)
    '#30d78a', -- vert   (2)
    '#a2734c', -- jaune  (3)
    '#1977eb', -- bleu   (4)
    '#a347ba', -- magenta(5)
    '#2aa1b3', -- cyan   (6)
    '#d0cfcc', -- blanc  (7)
  },
  brights = {
    '#5e5c64', -- noir clair   (8)
    '#f66151', -- rouge clair   (9)
    '#33da7a', -- vert clair   (10)
    '#e9ad0c', -- jaune clair  (11)
    '#2a7bde', -- bleu clair   (12)
    '#c061cb', -- magenta clair(13)
    '#33c7de', -- cyan clair   (14)
    '#ffffff', -- blanc clair  (15)
  },

  cursor_fg = '#d0cfcc',      -- couleur du caractère sous le curseur (optionnel)
  cursor_bg = '#d0cfcc',      -- couleur de fond du curseur (le curseur lui-même)
  cursor_border = '#d0cfcc',

  tab_bar = {
    active_tab = {
      bg_color = '#0f0f12',
      fg_color = '#d0cfcc'
    }
  }
}

config.initial_cols = 120
config.initial_rows = 50

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
