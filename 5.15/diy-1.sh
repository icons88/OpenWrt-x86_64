sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
