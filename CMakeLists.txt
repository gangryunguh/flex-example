cmake_minimum_required(VERSION 2.8)
project(flex_practice C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "-g -O0")
set(CMAKE_BUILD_TYPE Debug)

find_package(FLEX)

FLEX_TARGET(REPLACE replace.l ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.c)
FLEX_TARGET(CXREF cxref.l ${CMAKE_CURRENT_BINARY_DIR}/cxref.yy.c)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(replace
        ${FLEX_REPLACE_OUTPUTS}
)
add_executable(cxref
        ${FLEX_CXREF_OUTPUTS}
)
