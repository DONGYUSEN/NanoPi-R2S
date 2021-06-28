# 使用 Github Actions 在线编译 NanoPi-R2S 固件




## 说明
* 管理 IP: 192.168.2.1
* 默认管理密码: password 或者为空

## NanoPi-R2S RK3328 OpenWrt 19.07特色
* 支持 RTL8821CU/RTL8822BU/RTL8812AU 芯片的 USB WiFi 设备。
* 集成 [HelloWorld](https://github.com/jerrykuku/luci-app-vssr) openclash, vssr足够用了。
* 集成 [luci-app-adguardhome](https://github.com/rufengsuixing/luci-app-adguardhome)
* 集成 [luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon)
* 集成 [luci-app-r2sflasher](https://github.com/songchenwen/nanopi-r2s/tree/master/luci-app-r2sflasher)
* 集成 Zerotier、打印机、kms服务器等
* 稳定自用。

## FriendlyElec R2S 官方原版，重新编译，没有添加任何多余的软件。

## 用法
Fork 到自己的账号下，将 `.github/workflows` 下修改编译。

## 注意
产品发布初期，官方代码每天都在变，遇到无法编译时，请过来查看 `.yml` 与 `config` 最新异动。

## 参考
* [使用Github的Actions功能在线编译NanoPi-R1S固件（包含H5和H3）](https://totoro.site/index.php/archives/70/)
* [skytotwo/NanoPi-R1S-Build-By-Actions](https://github.com/skytotwo/NanoPi-R1S-Build-By-Actions)
* [immortalwrt](https://github.com/immortalwrt/build-immortalwrt)
* [klever1988/nanopi-openwrt](https://github.com/klever1988/nanopi-openwrt)
* [songchenwen/nanopi-r2s](https://github.com/songchenwen/nanopi-r2s)
* [fanck0605/nanopi_r2s](https://github.com/fanck0605/openwrt-nanopi-r2s)
* [soffchen/NanoPi-R2S](https://github.com/soffchen/NanoPi-R2S)
* [biliwala/nanopi-openwrt](https://github.com/biliwala/nanopi-openwrt)
* [SuLingGG/OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi)
