# source assets will be installed from this directory
set(AUDIOSVCHOST_SOURCE_ASSETS_DIR "${CMAKE_SOURCE_DIR}/src_assets")

# enable system tray, we will disable this later if we cannot find the required package config on linux
set(AUDIOSVCHOST_TRAY 1)
