1. Launch the Project Creator
2. Create a NuttX Simulator project
3. Follow the remaining steps given by the Project Creator
    1. Install the NuttX prerequisites and KConfig frontend in https://nuttx.apache.org/docs/latest/quickstart/install.html.\nAditionally
    2. Install `unzip`
    3. Run `./setup.sh` or run the following commands
        ```sh
        git submodule update --init
        cd apps
        ln --symbolic --force ../my_lvgl_apps
        cd ..
        cd nuttx
        ./tools/configure.sh -l sim:lvgl_fb
        kconfig-tweak --enable CONFIG_MY_LVGL_APPS_MY_LVGL_APP
        kconfig-tweak --set-str CONFIG_INIT_ENTRYPOINT my_lvgl_app_main
        yes '' | make oldconfig
        cd ..
        ```
    4. Run the following commands
        ```sh
        cd nuttx
        make nuttx
        ./nuttx
        ```
