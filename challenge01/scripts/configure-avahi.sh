apt-get install avahi-daemon avahi-utils -y
avahi-browse --all -t

cat > /etc/avahi/avahi-daemon.conf << EOF
[server]
domain-name=local
use-ipv4=yes
use-ipv6=no
ratelimit-interval-usec=1000000
ratelimit-burst=1000
[wide-area]
enable-wide-area=yes

[publish]
publish-hinfo=no
publish-workstation=no
publish-addresses=yes
publish-domain=yes
publish-aaaa-on-ipv4=no
EOF
