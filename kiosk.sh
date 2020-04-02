#!/bin/bash
xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

/usr/bin/chromium-browser --noerrdialogs --disable-infobars --incognito --disable-translate --kiosk http://129.0.0.7/covid19/ --window-size=1920,1080 --window-position=0,0 &

while true; do
   xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
   sleep 10
done