#!/usr/bin/env bash

STAT="$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')"

sketchybar -m --set "$NAME" label="$STAT%"
