if(UNIX)
    if(${AUDIOSVCHOST_CONFIGURE_HOMEBREW})
        configure_file(packaging/audiosvchost.rb audiosvchost.rb @ONLY)
    endif()
endif()

if(APPLE)
    if(${AUDIOSVCHOST_CONFIGURE_PORTFILE})
        configure_file(packaging/macos/Portfile Portfile @ONLY)
    endif()
elseif(UNIX)
    # configure the .desktop file
    set(AUDIOSVCHOST_DESKTOP_ICON "audiosvchost")
    if(${AUDIOSVCHOST_BUILD_APPIMAGE})
        configure_file(packaging/linux/AppImage/${PROJECT_FQDN}.desktop ${PROJECT_FQDN}.desktop @ONLY)
    elseif(${AUDIOSVCHOST_BUILD_FLATPAK})
        set(AUDIOSVCHOST_DESKTOP_ICON "${PROJECT_FQDN}")
        configure_file(packaging/linux/flatpak/${PROJECT_FQDN}.desktop ${PROJECT_FQDN}.desktop @ONLY)
    else()
        configure_file(packaging/linux/${PROJECT_FQDN}.desktop ${PROJECT_FQDN}.desktop @ONLY)
        configure_file(packaging/linux/${PROJECT_FQDN}.terminal.desktop ${PROJECT_FQDN}.terminal.desktop @ONLY)
    endif()

    # configure metadata file
    configure_file(packaging/linux/${PROJECT_FQDN}.metainfo.xml ${PROJECT_FQDN}.metainfo.xml @ONLY)

    # configure service
    configure_file(packaging/linux/audiosvchost.service.in audiosvchost.service @ONLY)

    # configure the arch linux pkgbuild
    if(${AUDIOSVCHOST_CONFIGURE_PKGBUILD})
        configure_file(packaging/linux/Arch/PKGBUILD PKGBUILD @ONLY)
        configure_file(packaging/linux/Arch/audiosvchost.install audiosvchost.install @ONLY)
    endif()

    # configure the flatpak manifest
    if(${AUDIOSVCHOST_CONFIGURE_FLATPAK_MAN})
        configure_file(packaging/linux/flatpak/${PROJECT_FQDN}.yml ${PROJECT_FQDN}.yml @ONLY)
        file(COPY packaging/linux/flatpak/deps/ DESTINATION ${CMAKE_BINARY_DIR})
        file(COPY packaging/linux/flatpak/modules DESTINATION ${CMAKE_BINARY_DIR})
        file(COPY generated-sources.json DESTINATION ${CMAKE_BINARY_DIR})
        file(COPY package-lock.json DESTINATION ${CMAKE_BINARY_DIR})
    endif()
endif()

# return if configure only is set
if(${AUDIOSVCHOST_CONFIGURE_ONLY})
    # message
    message(STATUS "AUDIOSVCHOST_CONFIGURE_ONLY: ON, exiting...")
    set(END_BUILD ON)
else()
    set(END_BUILD OFF)
endif()
