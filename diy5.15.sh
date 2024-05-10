
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile

function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}

rm -rf package/custom; mkdir package/custom

git clone https://github.com/jerrykuku/lua-maxminddb.git  package/lua-maxminddb

git clone https://github.com/fw876/helloworld.git package/ssr

git clone https://github.com/firker/diy-ziyong.git package/diy-ziyong
# git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon-18.06
# git clone https://github.com/gngpp/luci-theme-neobird.git package/luci-theme-neobird
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd

git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall

find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns

git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# git clone https://github.com/firkerword/luci-app-serverchan.git package/luci-app-serverchan
# git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
# merge_package https://github.com/vernesong/OpenClash OpenClash/luci-app-openclash

