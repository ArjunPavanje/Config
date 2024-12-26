#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Screenshot

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Screenshot'
mesg="DIR: `xdg-user-dir PICTURES`/Screenshots"

# Define number of icons and columns
list_col='1'
list_row='2'
win_width='200px'

# Icons for the two options
option_1=""  # Full-screen
option_2=""  # Partial screen (with slurp)

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row; border: 0px; padding: 0px;}" \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-show-icons \
		-theme ${theme} \
		-location 3 \
		-font "FiraCode Nerd Font 24" \
		-select-item 0
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2" | rofi_cmd
}

# Screenshot Folder and Timestamp
screenshot_folder=~/Pictures/Screenshots
mkdir -p "$screenshot_folder"
timestamp=$(date +%Y%m%d_%H%M%S)

# Notify and View Screenshot (no longer opens image)
notify_view() {
	notify_cmd_shot='dunstify -u low --replace=699'
	${notify_cmd_shot} "Copied to clipboard."
	# Remove or comment out this line if you don't want the image viewer to open the screenshot
	# viewnior ${screenshot_folder}/"$file"
	if [[ -e "$screenshot_folder/$file" ]]; then
		${notify_cmd_shot} "Screenshot Saved."
	else
		${notify_cmd_shot} "Screenshot Deleted."
	fi
}

# Copy screenshot to clipboard
copy_shot() {
	tee "$file" | wl-copy
}

# Full-screen capture
shotnow() {
	grim "$screenshot_folder/screenshot_$timestamp.png"
	grim - | wl-copy
	notify_view
}

# Partial screen capture using slurp (fixed to only call slurp once)
shotarea() {
	# Capture the selected region using slurp and save it to a file
	grim -g "$(slurp)" "$screenshot_folder/screenshot_$timestamp.png"
	# Also copy it to clipboard
	grim -g "$(slurp)" - | wl-copy
	notify_view
}

# Execute Command Based on Rofi Selection
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		shotnow
	elif [[ "$1" == '--opt2' ]]; then
		shotarea
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
esac

