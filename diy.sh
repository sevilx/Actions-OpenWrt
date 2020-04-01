#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#echo '修改机器名称'
#sed -i 's/OpenWrt/OpenWrt-Ben/g' package/base-files/files/bin/config_generate

#echo '修改网关地址'
#sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# 更改默认主题为Argon
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' package/feeds/luci/luci/Makefile
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06 package/lean/luci-theme-argon_new
sed -i 's/luci-theme-bootstrap/luci-theme-argon_new/g' package/feeds/luci/luci/Makefile

#echo '去除默认bootstrap主题'
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap


# 添加第三方软件包
# 复杂的AdGuardHome的openwrt的luci界面
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
# DiskMan for LuCI (WIP)
# git clone https://github.com/lisaac/luci-app-diskman.git package/luci-app-diskman
# mkdir -p package/mine/parted && cp -i package/mine/luci-app-diskman/Parted.Makefile package/parted/Makefile
# KPR plus+
# git clone https://github.com/project-openwrt/luci-app-koolproxyR.git package/luci-app-koolproxyR
# Server酱
# git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
# FileBrowser
# git clone https://github.com/project-openwrt/FileBrowser.git package/FileBrowser
# OpenClash
# git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# 管控上网行为
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

echo '修改banner'
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/
