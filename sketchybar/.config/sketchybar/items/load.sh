#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$CONFIG_DIR/icons.sh"

memory=(
	script="$PLUGIN_DIR/load.sh"
	label.color="$WHITE"
  padding_right=0
  padding_left=8
	icon="$MEMORY"
  icon.color=$WHITE              
  icon.font="$FONT:Regular:14.0" 
	update_freq=10
	updates=on
)

sketchybar --add item load right \
	         --set load "${memory[@]}"
