#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$CONFIG_DIR/icons.sh"

HACK_FONT='Hack Nerd Font'

memory=(
	script="$PLUGIN_DIR/load.sh"
	label.color="$WHITE"
  padding_right=0
  padding_left=8
	icon="$MEMORY"
  icon.color=$WHITE
  icon.font="$HACK_FONT:Regular:14.0" 
	update_freq=10
	updates=on
)

sketchybar --add item load right \
	         --set load "${memory[@]}"
