#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# fw876/helloworld
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Lienol/openwrt-package
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default


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
