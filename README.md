# C++20 modules, conan package module logger

Conan library as C++20 module.

# Requirements

* CMake >= 3.28
* ninja >= 1.11.1
* clang >= 19
* conan >= 2.16

# Install

## Conan

    git clone https://github.com/conan-io/conan.git conan-io
    cd conan-io
    sudo pip install -e . --break-system-packages

## Clang

    sudo apt install clang-19 clang-tools-19
    bash update-alternatives-clang.sh 19 19

Set clang alternative

    update-alternatives --config clang

## Other requirements

No need to build and install CMake and ninja, conan will install and used them, see conanfile.py and build scripts how to do it.

# Build

    bash build


## Docs

To support conan recipe for other complilers see [fmt-conan-recipe](https://github.com/jcar87/cxx-module-packaging/blob/main/experiments/02-bmi-packaging/fmt-recipe/conanfile.py)
