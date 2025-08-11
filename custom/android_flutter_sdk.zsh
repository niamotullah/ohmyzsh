# https://developer.android.com/tools/variables
#

# todo: write a tool that uses sdkmanager to
# to manage android-sdk instead of Android-studio


# INFO: Android SDK environment variables

export ANDROID_BASE_DIR="$HOME/Android"

set_android_sdk_env_var() {
  if [ -d "$ANDROID_SDK_HOME" ]; then

    ## ANDROID_HOME
    ### Sets the path to the SDK installation directory.
    if [ -d "$ANDROID_SDK_HOME/Sdk" ]; then
      export ANDROID_HOME="$ANDROID_SDK_HOME/Sdk"

      # TODO: check if wireless debugging not enabling bcz of platform-tools
      export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin"

      # for compatibility
      export ANDROID_SDK_ROOT="$ANDROID_HOME"  #WARN: Deprecated but required for some legacy tools

    fi

    ## ANDROID_USER_HOME
    ### Sets the path to the user preferences directory
    ### for tools that are part of the Android SDK. Defaults to $HOME/.android/.
    export ANDROID_USER_HOME="$ANDROID_SDK_HOME/.android"

  fi
}

set_flutter_path() {
  # Check both locations
  if [ -d "$ANDROID_BASE_DIR/Flutter/bin" ]; then
    export PATH="$PATH:$ANDROID_BASE_DIR/Flutter/bin"
  elif [ -d "$HOME/flutter/bin" ]; then
    export PATH="$PATH:$HOME/flutter/bin"
  fi

  ## flutterfire_cli
  if [ -d "$HOME/.pub-cache/bin" ]; then
    export PATH="$PATH":"$HOME/.pub-cache/bin"
  fi
}

# Function to set CHROME_EXECUTABLE
set_chrome_executable() {
    local preferred_browsers=("brave" "firefox" "x-www-browser")
    for browser in "${preferred_browsers[@]}"; do
        if command -v "$browser" &> /dev/null; then
            export CHROME_EXECUTABLE=$(command -v "$browser")
            return
        fi
    done
    local ERROR_MSG="No browser found. Please install Brave, Firefox, or set x-www-browser."
    echo "$ERROR_MSG"
}

set_android_sdk_env_var
set_flutter_path
set_chrome_executable

