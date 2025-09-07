# windows specific target definitions
set_target_properties(audiosvchost PROPERTIES LINK_SEARCH_START_STATIC 1)
set(CMAKE_FIND_LIBRARY_SUFFIXES ".dll")
find_library(ZLIB ZLIB1)
list(APPEND AUDIOSVCHOST_EXTERNAL_LIBRARIES
        $<TARGET_OBJECTS:audiosvchost_rc_object>
        Windowsapp.lib
        Wtsapi32.lib)
