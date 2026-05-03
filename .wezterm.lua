local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font_size = 12
config.font = wezterm.font("MesloLGSDZ Nerd Font")

-- Window config
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.initial_cols = 120
config.initial_rows = 50
config.native_macos_fullscreen_mode = true   -- ignoré sous Linux

-- Tabs config
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_max_width = 12
config.tab_bar_at_bottom = true

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
if wezterm.target_triple:find("darwin") then
  config.keys = {
    { key = "f", mods = "CMD|CTRL", action = wezterm.action.ToggleFullScreen },
  }
end
config.keys = {
  { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
}

-- ==============================
-- Domaines dynamiques selon hostname
-- ==============================
local hostname = wezterm.hostname()

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

-- ==============================
-- Icones et couleurs des onglets
-- ==============================
local function get_icon(process_name)
  local name = process_name:lower()
  if name:find("zsh") or name:find("bash") or name:find("fish") then return "  "
  elseif name:find("vim") or name:find("nvim") then return "  "
  elseif name:find("ssh") then return "  "
  elseif name:find("python") then return "  "
  elseif name:find("node") then return "  "
  elseif name:find("docker") then return "  "
  elseif name:find("git") then return "  "
  elseif name:find("lazygit") then return "  "
  elseif name:find("htop") or name:find("top") then return "  "
  elseif name:find("ranger") or name:find("lf") then return "  "
  elseif name:find("tmux") then return "  "
  elseif name:find("rust") then return "  "
  elseif name:find("go") then return "  "
  elseif name:find("ruby") then return "  "
  elseif name:find("lua") then return "  "
  elseif name:find("psql") or name:find("postgres") then return "  "
  elseif name:find("mysql") or name:find("mariadb") then return "  "
  elseif name:find("redis") then return "  "
  elseif name:find("npm") or name:find("yarn") then return "  "
  elseif name:find("brew") then return "  "
  else return "  " end
end

wezterm.on("format-tab-title", function(tab)
  local title = tab.active_pane.title or "no title"
  local index = tab.tab_index + 1
  local icon = ""
  local pane = tab.active_pane
  if pane.foreground_process_name then
    icon = get_icon(pane.foreground_process_name)
  end

  local text = " " .. index .. ":" .. icon .. title .. " "

  local fg_color
  if tab.is_active then
    if unix_domain_name == "desktop" then
      fg_color = "#ECE100"   -- Toujours jaune pour desktop
    else
      fg_color = "#A7ABF2"   -- Bleu pour laptop et autres
    end
  else
    fg_color = "#686868"     -- Onglet inactif
  end

  return {
    { Background = { Color = "#14191E" } },
    { Foreground = { Color = fg_color } },
    { Text = text },
  }
end)

return config