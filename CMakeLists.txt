cmake_minimum_required(VERSION 3.0)
project(flex_example C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "-O0 -ll")
find_package(FLEX)

FLEX_TARGET(MyExample example.l ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.c)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(example
        ${FLEX_MyExample_OUTPUTS}
)
