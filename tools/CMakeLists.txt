cmake_minimum_required(VERSION 3.20)

project(audiosvchost_tools)

include_directories("${CMAKE_SOURCE_DIR}")

add_executable(dxgi-info dxgi.cpp)
set_target_properties(dxgi-info PROPERTIES CXX_STANDARD 23)
target_link_libraries(dxgi-info
        ${CMAKE_THREAD_LIBS_INIT}
        dxgi
        ${PLATFORM_LIBRARIES})
target_compile_options(dxgi-info PRIVATE ${AUDIOSVCHOST_COMPILE_OPTIONS})

add_executable(audio-info audio.cpp)
set_target_properties(audio-info PROPERTIES CXX_STANDARD 23)
target_link_libraries(audio-info
        ${Boost_LIBRARIES}
        ${CMAKE_THREAD_LIBS_INIT}
        ksuser
        ${PLATFORM_LIBRARIES})
target_compile_options(audio-info PRIVATE ${AUDIOSVCHOST_COMPILE_OPTIONS})

add_executable(audiosvchostsvc audiosvchostsvc.cpp)
set_target_properties(audiosvchostsvc PROPERTIES CXX_STANDARD 23)
target_link_libraries(audiosvchostsvc
        ${CMAKE_THREAD_LIBS_INIT}
        wtsapi32
        ${PLATFORM_LIBRARIES})
target_compile_options(audiosvchostsvc PRIVATE ${AUDIOSVCHOST_COMPILE_OPTIONS})
