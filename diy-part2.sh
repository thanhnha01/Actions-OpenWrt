#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

NTN='uci -q batch << EOI
set wireless.radio0.disabled='0'
set wireless.default_radio0.ssid='💕WIFI💕'
set wireless.default_radio0.encryption='psk2'
set wireless.default_radio0.key='12344321'
set wireless.radio1.disabled='0'
set wireless.default_radio1.ssid='💕WIFI💕'
set wireless.default_radio1.encryption='psk2'
set wireless.default_radio1.key='12344321'
commit wireless
set network.USB=interface
set network.USB.device='/sys/devices/platform/soc/20980000.usb/usb1/1-1/1-1.2/1-1.2.1'
set network.USB.username='v-internet'
set network.USB.proto='modemmanager'
commit network
EOI'
echo "${NTN}" >> /package/base-files/files/etc/uci-defaults/99-custom
