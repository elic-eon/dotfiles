#!/usr/bin/env bash

LOAD_AVERAGE=$(uptime | sed 's/.*load averages: //')
FIVE_MINS_LOAD=$(echo "$LOAD_AVERAGE" | awk '{print $1}')

sketchybar --set $NAME label=$FIVE_MINS_LOAD