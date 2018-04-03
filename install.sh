#! /bin/sh

yum install gcc openssl-devel make net-tool
sh configure
make && make install
mkdir /etc/shadowsocks
cp ~/shadowsocks-libev/shadowsocks.service /lib/systemd/system/shadowsocks.service
cp ~/shadowsocks-libev/config.json /etc/shadowsocks/config.json
systemctl enable shadowsocks.service
firewall-cmd --add-port=20517/tcp --permanent
firewall-cmd --reload