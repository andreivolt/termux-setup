#!/data/data/com.termux/files/usr/bin/bash

TAILSCALE_IP=$(ifconfig 2>/dev/null | grep -A 1 tun0 | grep inet | awk '{print $2}')

if [ -n "$TAILSCALE_IP" ]; then
    sed -i '/^ListenAddress/d' $PREFIX/etc/ssh/sshd_config
    echo "ListenAddress $TAILSCALE_IP" >> $PREFIX/etc/ssh/sshd_config
fi

sshd