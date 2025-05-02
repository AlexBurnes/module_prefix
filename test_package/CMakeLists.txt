cmake_minimum_required(VERSION 3.28)
project(PackageTest CXX)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

find_package(module-prefix CONFIG REQUIRED)
find_package(module-logger CONFIG REQUIRED)

add_executable(
    example
        example.cpp
)

target_link_libraries(
    example
    PRIVATE
        module-prefix::module-prefix
        module-logger::module-logger
)
