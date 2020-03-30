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

echo '修改默认主题'
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

#echo '去除默认bootstrap主题'
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

echo '删除旧版argon,链接新版'
rm -rf package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

# 添加第三方软件包
#git clone https://github.com/KFERMercer/luci-app-serverchan package/luci-app-serverchan
#git clone https://github.com/kang-mk/luci-app-smartinfo package/luci-app-smartinfo
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
#git clone https://github.com/Leo-Jo-My/luci-theme-leo.git package/luci-theme-leo
#git clone https://github.com/Aslin-Ameng/luci-theme-Night.git package/luci-theme-Night
#git clone https://github.com/Aslin-Ameng/luci-theme-Light.git package/luci-theme-Light
#git clone https://github.com/Flowers-in-thorns/luci-app-vssr-coexist.git package/luci-app-vssr-coexist

echo '修改banner'
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/
