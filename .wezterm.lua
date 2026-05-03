local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 12
config.font = wezterm.font("MesloLGSDZ Nerd Font")

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

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
    active_tab = { bg_color = "#A7ABF2", fg_color = "#FFFFFF" },
    inactive_tab = { bg_color = "#14191E", fg_color = "#686868" },
    inactive_tab_edge = "#A7ABF2",
  },
}

config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_max_width = 12
config.tab_bar_at_bottom = true

-- Icônes pour les programmes courants (police Nerd Font obligatoire)
local function get_icon(process_name)
  local name = process_name:lower()
  if name:find("zsh") or name:find("bash") or name:find("fish") then
    return "  " -- terminal shell
  elseif name:find("vim") or name:find("nvim") then
    return "  " -- vim/neovim
  elseif name:find("ssh") then
    return "  " -- ssh
  elseif name:find("python") then
    return "  " -- python
  elseif name:find("node") then
    return "  " -- node.js
  elseif name:find("docker") then
    return "  " -- docker
  elseif name:find("git") then
    return "  " -- git
  elseif name:find("lazygit") then
    return "  " -- lazygit
  elseif name:find("htop") or name:find("top") then
    return "  " -- htop/top
  elseif name:find("ranger") or name:find("lf") then
    return "  " -- file manager
  elseif name:find("tmux") then
    return "  " -- tmux
  elseif name:find("rust") then
    return "  " -- rust
  elseif name:find("go") then
    return "  " -- go
  elseif name:find("ruby") then
    return "  " -- ruby
  elseif name:find("lua") then
    return "  " -- lua
  elseif name:find("psql") or name:find("postgres") then
    return "  " -- postgresql
  elseif name:find("mysql") or name:find("mariadb") then
    return "  " -- mysql/mariadb
  elseif name:find("redis") then
    return "  " -- redis
  elseif name:find("npm") or name:find("yarn") then
    return "  " -- npm/yarn
  elseif name:find("brew") then
    return "  " -- homebrew
  else
    return "  " -- terminal générique
  end
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
  if tab.is_active then
    return {
      { Background = { Color = "#A7ABF2" } },
      { Foreground = { Color = "#14191E" } },
      { Text = text },
    }
  else
    return {
      { Background = { Color = "#14191E" } },
      { Foreground = { Color = "#686868" } },
      { Text = text },
    }
  end
end)

config.initial_cols = 120
config.initial_rows = 50

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.native_macos_fullscreen_mode = true

if wezterm.target_triple:find("darwin") then
  config.keys = {
    { key = "f", mods = "CMD|CTRL", action = wezterm.action.ToggleFullScreen },
  }
end

return config
