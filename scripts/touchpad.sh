TOUCHPAD="${1}"
if grep -q 'true' /tmp/touchpad_enabled; then
  echo 'false' > /tmp/touchpad_enabled
  hyprctl keyword "$TOUCHPAD:enabled" false
else
  echo 'true' > /tmp/touchpad_enabled
  hyprctl keyword "$TOUCHPAD:enabled" true
fi
