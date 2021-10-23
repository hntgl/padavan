#!/bin/sh
logger -t "Auto start" "Checking whether the router is connected to the Internet！"
count=0
while :
do
	ping -c 1 -W 1 -q www.google.com.vn 1>/dev/null 2>&1
	if [ "$?" == "0" ]; then
		break
	fi
	ping -c 1 -W 1 -q 202.108.22.5 1>/dev/null 2>&1
	if [ "$?" == "0" ]; then
		break
	fi
	sleep 5
	ping -c 1 -W 1 -q www.google.com 1>/dev/null 2>&1
	if [ "$?" == "0" ]; then
		break
	fi
	ping -c 1 -W 1 -q 8.8.8.8 1>/dev/null 2>&1
	if [ "$?" == "0" ]; then
		break
	fi
	sleep 5
	count=$((count+1))
	if [ $count -gt 18 ]; then
		break
	fi
done

if [ $(nvram get ss_enable) = 1 ] ; then
logger -t "Auto start" "Shadowsocks"
/usr/bin/shadowsocks.sh start
fi

if [ $(nvram get adg_enable) = 1 ] ; then
logger -t "Auto start" "adguardhome"
/usr/bin/adguardhome.sh start
fi
