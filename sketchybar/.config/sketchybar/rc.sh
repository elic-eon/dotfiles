#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors
source "$CONFIG_DIR/icons.sh" # Loads all defined icons

ITEM_DIR="$CONFIG_DIR/items" # Directory where the items are configured
PLUGIN_DIR="$CONFIG_DIR/plugins" # Directory where all the plugin scripts are stored

FONT="SF Pro" # Needs to have Regular, Bold, Semibold, Heavy and Black variants
# FONT="Hack Nerd Font"
PADDINGS=3 # All paddings use this value (icon, label, background)

# Unload the macOS on screen indicator overlay for volume change
#-- launchctl unload -F /System/Library/LaunchAgents/com.apple.OSDUIHelper.plist > /dev/null 2>&1 &

# Setting up the general bar appearance of the bar
bar=(
  height=28
  color=$BG0
  border_width=0
  border_color=$BAR_BORDER_COLOR
  corner_radius=9
  shadow=off
  position=top
  sticky=on
  # padding_right=6
  # padding_left=6
  padding_right=0
  padding_left=0
  y_offset=6
  margin=6
  # margin=0
  topmost=window
)

sketchybar --bar "${bar[@]}"

# Setting up default values
defaults=(
  updates=when_shown
  icon.font="$FONT:Bold:13.0"
  icon.color=$ICON_COLOR
  icon.padding_left=$PADDINGS
  icon.padding_right=$PADDINGS
  label.font="$FONT:Semibold:12.0"
  label.color=$LABEL_COLOR
  label.padding_left=$PADDINGS
  label.padding_right=$PADDINGS
  padding_right=$PADDINGS
  padding_left=$PADDINGS
  background.height=18
  background.corner_radius=6
  background.border_width=1
  popup.background.border_width=1
  popup.background.corner_radius=6
  popup.background.border_color=$POPUP_BORDER_COLOR
  popup.background.color=$POPUP_BACKGROUND_COLOR
  popup.blur_radius=20
  popup.background.shadow.drawing=on
  scroll_texts=on
)

sketchybar --default "${defaults[@]}"

# sketchybar --add item seperator.cl center                 \
#            --set      seperator.cl padding_left=0         \
#                                    padding_right=0        \
#           #                         icon=· \
#                                    icon.font="$FONT:Heavy:12.0" \
#                                    icon.padding_left=800 \
#                                    icon.padding_right=6 \
#                                    background.color=$BAR_COLOR \
#                                    background.height=28 \
#                                    background.corner_radius=9 \
#                                    icon.drawing=on       \
#                                    label.drawing=off
#
# sketchybar --add item seperator.cc center                 \
#            --set      seperator.cc padding_left=96        \
#                                    padding_right=96        \
#                                    background.drawing=off \
#                                    icon.drawing=off       \
#                                    label.drawing=off
#
# sketchybar --add item seperator.cr center                 \
#            --set      seperator.cr padding_left=0        \
#                                    padding_right=0        \
#                                    icon.padding_left=6 \
#                                    icon.padding_right=800 \
#                                    background.color=$BAR_COLOR \
#                                    background.height=28 \
#                                    background.corner_radius=9 \
#                                    icon.font="$FONT:Heavy:12.0" \
#           #                         icon=· \
#                                    icon.drawing=on       \
#                                    label.drawing=off

# Left
source "$ITEM_DIR/apple.sh"
source "$ITEM_DIR/spaces.sh"
source "$ITEM_DIR/yabai.sh"
source "$ITEM_DIR/front_app.sh"

sketchybar --add bracket left apple.logo '/space\..*/' space_creator front_app \
           --set         left background.color=$BAR_COLOR \
                              background.height=28 \
                              background.corner_radius=9

# Center
# source "$ITEM_DIR/spotify.sh"
source "$ITEM_DIR/spotify_new.sh"
# source "$ITEM_DIR/media.sh"

# Right
source "$ITEM_DIR/calendar.sh"
source "$ITEM_DIR/brew.sh"
source "$ITEM_DIR/github.sh"
source "$ITEM_DIR/wifi.sh"
source "$ITEM_DIR/battery.sh"
source "$ITEM_DIR/volume.sh"
source "$ITEM_DIR/memory.sh"
source "$ITEM_DIR/cpu.sh"
source "$ITEM_DIR/load.sh"
# source "$ITEM_DIR/svim.sh"

sketchybar --add bracket right calendar status memory cpu load \
           --set         right background.color=$BAR_COLOR \
                               background.height=28 \
                               background.corner_radius=9



sketchybar --hotload on

# Forcing all item scripts to run (never do this outside of sketchybarrc)
sketchybar --update

echo "sketchybar configuation loaded.."
