#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$CONFIG_DIR/icons.sh"

memory=(
	script="$PLUGIN_DIR/ram.sh"
	label.color="$WHITE"
	icon="/"
	padding_left=0
  icon.font="$FONT:Semibold:12.0"
  icon.padding_left=2
  icon.padding_right=2
	update_freq=10
	updates=on
)

sketchybar --add item memory right \
	--set memory "${memory[@]}"
