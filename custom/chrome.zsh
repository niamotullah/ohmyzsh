# Set Brave as default chromium browser
## sets CHROME_EXECUTABLE variable to the availabe Brave executable
if command -v brave-origin &>/dev/null; then
	## brave-origin
	export CHROME_EXECUTABLE="brave-origin"
elif command -v brave-browser &>/dev/null; then
	## brave-browser
	export CHROME_EXECUTABLE="brave-browser"
fi
