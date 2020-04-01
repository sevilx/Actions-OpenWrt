#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

#echo '修改机器名称'
#sed -i 's/OpenWrt/OpenWrt-Ben/g' package/base-files/files/bin/config_generate

#echo '修改默认地址'
sed -i 's/192.168.1.1/192.168.99.253/g' package/base-files/files/bin/config_generate

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# 更改默认主题为Argon
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' package/feeds/luci/luci/Makefile
# 删除旧版argon,更改为新版
rm -rf ./package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06 package/lean/luci-theme-argon_new
sed -i 's/luci-theme-bootstrap/luci-theme-argon_new/g' package/feeds/luci/luci/Makefile

#echo '去除默认bootstrap主题'
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap


# 添加第三方软件包
# 复杂的AdGuardHome的openwrt的luci界面
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/lean/luci-app-adguardhome
# DiskMan for LuCI (WIP)
# git clone https://github.com/lisaac/luci-app-diskman.git package/lean/luci-app-diskman
# mkdir -p package/mine/parted && cp -i package/mine/luci-app-diskman/Parted.Makefile package/lean/parted/Makefile
# KPR plus+
# git clone https://github.com/project-openwrt/luci-app-koolproxyR.git package/lean/luci-app-koolproxyR
# Server酱
# git clone https://github.com/tty228/luci-app-serverchan.git package/lean/luci-app-serverchan
# FileBrowser
# git clone https://github.com/project-openwrt/FileBrowser.git package/lean/FileBrowser
# OpenClash
# git clone https://github.com/vernesong/OpenClash.git package/lean/OpenClash
# 管控上网行为
# git clone https://github.com/destan19/OpenAppFilter.git package/lean/OpenAppFilter

echo '修改banner'
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/
