cmake_minimum_required(VERSION 3.28)
project(module_prefix CXX)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

find_package(fmt CONFIG REQUIRED)

add_library(prefix)

target_sources(
    prefix PUBLIC
    FILE_SET prefix
    TYPE CXX_MODULES
    FILES src/prefix.mpp
)

target_link_libraries(
    prefix 
    PRIVATE 
        fmt::fmt
)

set_target_properties(
    prefix PROPERTIES
    LINKER_LANGUAGE CXX
    CXX_EXTENSIONS ON
    IMPORTED_CXX_MODULES_COMPILE_FEATURES "cxx_std_20"
    INTERFACE_COMPILE_FEATURES "cxx_std_20"
)

add_library(module-prefix::module-prefix ALIAS prefix)

install(
    TARGETS prefix
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
