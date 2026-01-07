export PATH="/opt/X11/bin:$PATH"
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
podman run --pull=never --rm -it --name telegram \
       -e DISPLAY=$(xhost + $(hostname) > /dev/null; echo $IP):0 \
       -v /etc/localtime:/etc/localtime:ro \
       -v ~/.TelegramDesktop:/home/user/.local/share/TelegramDesktop/ "library/telegram-desktop:latest"

