cmake_minimum_required(VERSION 3.0)
project(flex_example C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "-g -O0")
find_package(FLEX)

FLEX_TARGET(CONTEXT example.l ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.c)
FLEX_TARGET(CXREF cxref.l ${CMAKE_CURRENT_BINARY_DIR}/cxref.yy.c)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(context
        ${FLEX_CONTEXT_OUTPUTS}
)
add_executable(cxref
        ${FLEX_CXREF_OUTPUTS}
)
