#!/bin/bash

DIR=$(dirname $0)

git -C $DIR submodule update --init

cd $DIR/apps
ln --symbolic --force ../my_lvgl_apps
cd ..

if [ -e $DIR/nuttx/.config ]; then
    echo "NuttX already has a config loaded."
    echo "Run 'make -C nuttx distclean' and try again."
    exit 1
fi

cd $DIR/nuttx
./tools/configure.sh -l sim:lvgl_fb
kconfig-tweak --enable CONFIG_MY_LVGL_APPS_MY_LVGL_APP
yes '' | make oldconfig
cd ..

echo
echo "Ready. Run 'cd nuttx/' and 'make -j$(nproc)'"
