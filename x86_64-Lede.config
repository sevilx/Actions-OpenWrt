#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

#lan_ip='192.168.1.1'        # Lan Ip地址
utc_name='Asia\/Shanghai'   # 时区
delete_bootstrap=true       # 是否删除默认主题 true 、false
default_theme='argon_mc1'   # 默认主题 结合主题文件夹名字 
theme_argon='https://github.com/sypopo/luci-theme-argon-mc.git'  # 主题地址
#openClash_url='https://github.com/vernesong/OpenClash.git'       # OpenClash包地址 
#lienol_url='https://github.com/Lienol/openwrt-package.git'       # Lienol 包地址
# 命令
# echo "修改机器名称"
# sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate

# echo "修改wifi名称"
# sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

#echo "设置lan ip"
#sed -i "s/192.168.1.1/$lan_ip/g" package/base-files/files/bin/config_generate

echo "修改时区"
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='$utc_name'/g" package/base-files/files/bin/config_generate

echo "修改默认主题"
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci

if [ $delete_bootstrap ] ;then
  echo "去除默认bootstrap主题"
  sed -i '/\+luci-theme-bootstrap/d' feeds/luci/collections/luci/Makefile
  sed -i '/\+luci-theme-bootstrap/d' package/feeds/luci/luci/Makefile
  sed -i '/CONFIG_PACKAGE_luci-theme-bootstrap=y/d' .config
  sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
fi

echo '添加主题argon'
git clone $theme_argon package/lean/luci-theme-argon-mc
rm -rf package/lean/luci-theme-argon-mc/screenshot
rm -rf package/lean/luci-theme-argon-mc/README.md
rm -rf package-temp
echo 'CONFIG_PACKAGE_luci-theme-argon-mc=y' >> .config

#echo '添加OpenClash'
#mkdir package-temp
#git clone $openClash_url package-temp
#mv -f package-temp/luci-app-openclash package/lean/

#  OpenClash
#echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
#echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y'  >> .config

#echo '添加Lienol包'
#rm -rf package-temp
#git clone $lienol_url package-temp

#echo '添加Passwall'
#mkdir package/lean/luci-app-passwall
#mv -f package-temp/lienol/luci-app-passwall  package/lean/luci-app-passwall
#echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y' >> .config
#echo 'CONFIG_PACKAGE_luci-i18n-passwall-zh-cn=y'  >> .config

echo '删除下载缓存'
rm -rf package-temp

#创建自定义配置文件 - OpenWrt-x86-64

#rm -f ./.config*
#touch ./.config

#
# ========================固件定制部分========================
# 

cat >> .config <<EOF
# 编译x64固件:
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_Generic=y
# 固件压缩:
CONFIG_TARGET_IMAGES_GZIP=y
# 编译UEFI固件:
# CONFIG_EFI_IMAGES is not set
# IPv6支持:
# CONFIG_PACKAGE_ipv6helper=y
# CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# 多文件系统支持:
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-common=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-ntfs=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
# USB3.0支持:
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
# 第三方插件选择:
# Passwall插件:
#CONFIG_PACKAGE_luci-app-passwall=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ipt2socks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_socks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_socks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_haproxy=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_dns2socks=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_pdnsd=y
#CONFIG_PACKAGE_kcptun-client=y
#CONFIG_PACKAGE_haproxy=y
#CONFIG_PACKAGE_chinadns-ng=y
#CONFIG_PACKAGE_v2ray=y
#CONFIG_PACKAGE_trojan=y
#CONFIG_PACKAGE_brook=y
#CONFIG_PACKAGE_ipt2socks=y
#CONFIG_PACKAGE_shadowsocks-libev-config=y
#CONFIG_PACKAGE_shadowsocks-libev-ss-local=y
#CONFIG_PACKAGE_shadowsocks-libev-ss-redir=y
#CONFIG_PACKAGE_shadowsocksr-libev-alt=y
#CONFIG_PACKAGE_shadowsocksr-libev-ssr-local=y
# 常用LuCI插件(禁用):
# 取消文件传输
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-lib-fs is not set
# 取消流量监控
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
# CONFIG_PACKAGE_nlbwmon is not set
# CONFIG_PACKAGE_kmod-nf-conntrack-netlink is not set
# 取消内存清理
# CONFIG_PACKAGE_luci-app-ramfree is not set
# 取消ssr服务器
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Server is not set
# CONFIG_PACKAGE_shadowsocksr-libev-server is not set
# 取消网易音乐
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_UnblockNeteaseMusic_Go is not set
# CONFIG_UnblockNeteaseMusic_NodeJS is not set
# CONFIG_NODEJS_ICU_NONE is not set
# CONFIG_NODEJS_ICU_SMALL is not set
# CONFIG_NODEJS_ICU_SYSTEM is not set
# CONFIG_PACKAGE_UnblockNeteaseMusic is not set
# CONFIG_PACKAGE_UnblockNeteaseMusicGo is not set
# CONFIG_PACKAGE_libatomic is not set
# CONFIG_PACKAGE_libcares is not set
# CONFIG_PACKAGE_libhttp-parser is not set
# CONFIG_PACKAGE_libnghttp2 is not set
# CONFIG_PACKAGE_libuv is not set
# CONFIG_PACKAGE_node is not set
# 取消激活win
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_vlmcsd is not set
# 取消vftp
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_vsftpd-alt is not set
# CONFIG_VSFTPD_USE_UCI_SCRIPTS is not set
# 取消迅雷加速
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# 取消zerotier
# CONFIG_PACKAGE_luci-app-zerotier is not set
# CONFIG_PACKAGE_kmod-tun is not set
# CONFIG_PACKAGE_libminiupnpc is not set
# CONFIG_PACKAGE_libnatpmp is not set
# CONFIG_PACKAGE_zerotier is not set
# CONFIG_ZEROTIER_ENABLE_DEBUG is not set
# CONFIG_ZEROTIER_ENABLE_SELFTEST is not set
# 常用LuCI插件(启用):
# 增加主题argon
CONFIG_PACKAGE_luci-theme-argon=y
# 增加多拨
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-i18n-mwan3-zh-cn=y
CONFIG_PACKAGE_mwan3=y
# 增加curl、snmp
CONFIG_LIBCURL_COOKIES=y
CONFIG_LIBCURL_FILE=y
CONFIG_LIBCURL_FTP=y
CONFIG_LIBCURL_HTTP=y
CONFIG_LIBCURL_NO_SMB="!"
CONFIG_LIBCURL_OPENSSL=y
CONFIG_LIBCURL_PROXY=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_libcurl=y
CONFIG_PACKAGE_libnetsnmp=y
CONFIG_PACKAGE_smartsnmpd=y
CONFIG_PACKAGE_snmpd=y
# 增加常用软件包
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_tree=y
CONFIG_PACKAGE_vim-fuller=y
CONFIG_PACKAGE_wget=y
# 编译VMware镜像以及镜像填充:
CONFIG_TARGET_IMAGES_PAD=y
# CONFIG_VMDK_IMAGES is not set
EOF

# 
# ========================固件定制部分结束========================
# 

sed -i 's/^[ \t]*//g' ./.config

# 配置文件创建完成
