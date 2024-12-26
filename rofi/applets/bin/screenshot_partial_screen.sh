screenshot_folder=~/Pictures/Screenshots
timestamp=$(date +%Y%m%d_%H%M%S)

# Get the current time for filename
# Define save directory and file name template
dir=~/Pictures/Screenshots
file="Screenshot_${time}.png"

grim -g "$(slurp)" "$screenshot_folder/screenshot_$timestamp.png" | wl-copy


