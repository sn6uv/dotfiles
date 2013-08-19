# Start X upon if logging in to tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    setsid xinit &
    sleep 5
    exit
fi
