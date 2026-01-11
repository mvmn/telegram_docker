export PATH="/opt/X11/bin:$PATH"
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

docker run --pull=never --rm -it --name telegram \
       --hostname=$(hostname) \
	       -e DISPLAY=$(xhost + $(hostname) > /dev/null; echo $IP):0 \
	       -v /etc/localtime:/etc/localtime:ro \
       -e PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native \
       -v ~/.TelegramDesktop:/home/user/.local/share/TelegramDesktop/ "library/telegram-desktop:latest"
