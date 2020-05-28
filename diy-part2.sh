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
#sed -i 's/192.168.1.1/192.168.99.253/g' package/base-files/files/bin/config_generate

# 修改版本
sed -i "s/OpenWrt /Ben build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo '去除默认bootstrap主题+修改默认主题为Argon'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

# 删除旧版argon/拉去新源/替换bootstrap为新版argon为默认主题
rm -rf ./package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06 package/lean/luci-theme-argon
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' package/feeds/luci/luci/Makefile

#echo '去除默认bootstrap主题'
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

#echo '修改banner'
#rm -rf package/base-files/files/etc/banner
#cp -f ../banner package/base-files/files/etc/

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="Ben"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"P3TERX"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
