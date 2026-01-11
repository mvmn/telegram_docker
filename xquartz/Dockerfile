# Base image
FROM debian:bookworm
LABEL maintainer="Christophe Boucharlat <christophe.boucharlat@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/xorilog/docker-telegram"

# Set environment
ENV HOME=/home/user
ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Create user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME \
    && usermod -a -G audio,video user

# Optional: allow passing proxies
ARG http_proxy=""
ARG https_proxy=""
ARG apt_sources="http://deb.debian.org"

# Update sources if needed
RUN if [ -n "$apt_sources" ]; then \
        sed -i "s@http://deb.debian.org@$apt_sources@g" /etc/apt/sources.list.d/debian.sources || true; \
    fi

# Install Telegram and dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        telegram-desktop \
        apt-utils \
        dbus-x11 \
        dunst \
        hunspell-en-us \
        python3-dbus \
        software-properties-common \
        libx11-xcb1 \
        libpulse0 \
        gconf2 \
        libdrm2 \
        libgtk-3-0 \
        libice6 \
        libsm6 \
        libegl1-mesa-dev \
        libgl1-mesa-glx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch to user
WORKDIR $HOME
USER user

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Autorun Telegram
CMD ["telegram-desktop"]


