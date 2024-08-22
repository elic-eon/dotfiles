#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$CONFIG_DIR/icons.sh"

cpu=(
  script="$PLUGIN_DIR/cpu.sh"
  update_freq=10
  icon="/"
	padding_left=0
	padding_right=0
  icon.font="$FONT:Semibold:12.0"
  icon.padding_left=2
  icon.padding_right=2
  icon.color=$WHITE              
  label.color=$WHITE
)

sketchybar --add item cpu right                          \
           --set      cpu "${cpu[@]}"