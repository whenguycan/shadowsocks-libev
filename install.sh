#! /bin/sh

yum install gcc openssl-devel make net-tools
sh configure
make && make install
mkdir /etc/shadowsocks
cp ~/shadowsocks-libev/shadowsocks.service /lib/systemd/system/shadowsocks.service
cp ~/shadowsocks-libev/config.json /etc/shadowsocks/config.json
systemctl start shadowsocks.service
systemctl enable shadowsocks.service
firewall-cmd --add-port=20517/tcp --permanent
firewall-cmd --reload