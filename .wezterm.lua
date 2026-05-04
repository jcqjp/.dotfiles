local wezterm = require("wezterm")
local config = wezterm.config_builder()
local hostname = wezterm.hostname()


-- Font
config.font = wezterm.font_with_fallback({
  { family = "MesloLGSDZ Nerd Font", weight = "Regular" },
  "Menlo",
  "monospace",
})
if hostname == "desktop" then
  config.font_size = 11
end
if hostname == "laptop.local" then
  config.font_size = 12
end


-- Window config
config.window_close_confirmation = "NeverPrompt"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.initial_cols = 120
config.initial_rows = 50
config.native_macos_fullscreen_mode = true -- ignoré sous Linux


-- Colors config
config.colors = {
  foreground = "#DCDCDC",
  background = "#14191E",
  cursor_bg = "#FFFFFF",
  cursor_fg = "#000000",
  cursor_border = "#FFFFFF",
  selection_bg = "#B3D7FF",
  selection_fg = "#000000",
  ansi = {
    "#14191E", "#B43C2A", "#00C200", "#C7C400",
    "#2744C7", "#C040BE", "#00C5C7", "#C7C7C7",
  },
  brights = {
    "#686868", "#DD7975", "#58E790", "#ECE100",
    "#A7ABF2", "#E17EE1", "#60FDFF", "#FFFFFF",
  },
  tab_bar = {
    background = "#14191E",
  },
}


-- Keyboard shortcuts
config.keys = {}
if wezterm.target_triple:find("darwin") then
  table.insert(config.keys, {
    key = "f", mods = "CMD|CTRL", action = wezterm.action.ToggleFullScreen,
  })
end
table.insert(config.keys, {
  key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay,
})


-- Domaines dynamiques selon hostname
local unix_domain_name
if hostname == "desktop" then
  unix_domain_name = "desktop"
elseif hostname == "laptop.local" then
  unix_domain_name = "laptop"
else
  unix_domain_name = "local"
end

config.unix_domains = {
  { name = unix_domain_name }
}
config.default_domain = unix_domain_name


-- Domaine SSH
if unix_domain_name == "laptop" then
  config.ssh_domains = {
    {
      name = "desktop",
      remote_address = "desktop",
      username = "user1",
    }
  }
end


-- Tabs styling
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_max_width = 12
config.tab_bar_at_bottom = true

wezterm.on("format-tab-title", function(tab)
  local pane = tab.active_pane
  local title = pane.title or "no title"
  local index = tab.tab_index + 1

  local text              = " " .. index .. ":" .. " " .. title .. " "

  local domain            = pane.domain_name
  local local_hostname    = wezterm.hostname() -- hostname de la machine qui exécute WezTerm

  local is_desktop_domain = (domain == "desktop" or domain == "SSH:desktop")
      or (domain == "local" and local_hostname == "desktop")

  local fg_color
  if tab.is_active then
    if is_desktop_domain then
      fg_color = "#ECE100"
    else
      fg_color = "#A7ABF2"
    end
  else
    fg_color = "#686868"
  end

  return {
    { Background = { Color = "#14191E" } },
    { Foreground = { Color = fg_color } },
    { Text = text },
  }
end)

return config
