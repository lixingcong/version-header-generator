cmake_minimum_required(VERSION 3.5)

project(cmake-demo LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(../../cmake/version-header-generator.cmake)

add_executable(cmake-demo main.cpp)
