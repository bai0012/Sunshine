# Publisher Metadata
set(AUDIOSVCHOST_PUBLISHER_NAME "Third Party Publisher"
        CACHE STRING "The name of the publisher (not developer) of the application.")
set(AUDIOSVCHOST_PUBLISHER_WEBSITE ""
        CACHE STRING "The URL of the publisher's website.")
set(AUDIOSVCHOST_PUBLISHER_ISSUE_URL "https://app.lizardbyte.dev/support"
        CACHE STRING "The URL of the publisher's support site or issue tracker.
        If you provide a modified version of AudioSvcHost, we kindly request that you use your own url.")

option(BUILD_DOCS "Build documentation" ON)
option(BUILD_TESTS "Build tests" ON)
option(NPM_OFFLINE "Use offline npm packages. You must ensure packages are in your npm cache." OFF)

option(BUILD_WERROR "Enable -Werror flag." OFF)

# if this option is set, the build will exit after configuring special package configuration files
option(AUDIOSVCHOST_CONFIGURE_ONLY "Configure special files only, then exit." OFF)

option(AUDIOSVCHOST_ENABLE_TRAY "Enable system tray icon." ON)

option(AUDIOSVCHOST_SYSTEM_WAYLAND_PROTOCOLS "Use system installation of wayland-protocols rather than the submodule." OFF)

if(APPLE)
    option(BOOST_USE_STATIC "Use static boost libraries." OFF)
else()
    option(BOOST_USE_STATIC "Use static boost libraries." ON)
endif()

option(CUDA_FAIL_ON_MISSING "Fail the build if CUDA is not found." ON)
option(CUDA_INHERIT_COMPILE_OPTIONS
        "When building CUDA code, inherit compile options from the the main project. You may want to disable this if
        your IDE throws errors about unknown flags after running cmake." ON)

if(UNIX)
    option(AUDIOSVCHOST_BUILD_HOMEBREW
            "Enable a Homebrew build." OFF)
    option(AUDIOSVCHOST_CONFIGURE_HOMEBREW
            "Configure Homebrew formula. Recommended to use with AUDIOSVCHOST_CONFIGURE_ONLY" OFF)
endif()

if(APPLE)
    option(AUDIOSVCHOST_CONFIGURE_PORTFILE
            "Configure macOS Portfile. Recommended to use with AUDIOSVCHOST_CONFIGURE_ONLY" OFF)
    option(AUDIOSVCHOST_PACKAGE_MACOS
            "Should only be used when creating a macOS package/dmg." OFF)
elseif(UNIX)  # Linux
    option(AUDIOSVCHOST_BUILD_APPIMAGE
            "Enable an AppImage build." OFF)
    option(AUDIOSVCHOST_BUILD_FLATPAK
            "Enable a Flatpak build." OFF)
    option(AUDIOSVCHOST_CONFIGURE_PKGBUILD
            "Configure files required for AUR. Recommended to use with AUDIOSVCHOST_CONFIGURE_ONLY" OFF)
    option(AUDIOSVCHOST_CONFIGURE_FLATPAK_MAN
            "Configure manifest file required for Flatpak build. Recommended to use with AUDIOSVCHOST_CONFIGURE_ONLY" OFF)

    # Linux capture methods
    option(AUDIOSVCHOST_ENABLE_CUDA
            "Enable cuda specific code." ON)
    option(AUDIOSVCHOST_ENABLE_DRM
            "Enable KMS grab if available." ON)
    option(AUDIOSVCHOST_ENABLE_VAAPI
            "Enable building vaapi specific code." ON)
    option(AUDIOSVCHOST_ENABLE_WAYLAND
            "Enable building wayland specific code." ON)
    option(AUDIOSVCHOST_ENABLE_X11
            "Enable X11 grab if available." ON)
endif()
