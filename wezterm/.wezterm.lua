local wezterm = require 'wezterm'
local config = {}
-- local config = wezterm.config_builder()


config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 14

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 24,
  right = 16,
  top = 24,
  bottom = 16,
}

-- Color
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.colors = {
  background = '#1c1c1c',
}

config.scrollback_lines = 20000

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0B0022'
    local background = '#1B1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#2B2042'
      foreground = '#C0C0C0'
    elseif hover then
      background = '#3B3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      -- { Background = { Color = edge_background } },
      -- { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      -- { Background = { Color = background } },
      -- { Foreground = { Color = foreground } },
      { Text = title },
      -- { Background = { Color = edge_background } },
      -- { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)


return config
