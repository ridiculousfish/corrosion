cmake_minimum_required(VERSION 3.12)

include(FindPackageHandleStandardArgs)

find_program(Bindgen_EXECUTABLE bindgen PATHS $ENV{HOME}/.cargo/bin)

execute_process(
    COMMAND
        ${Bindgen_EXECUTABLE} --version
    OUTPUT_VARIABLE _BINDGEN_VERSION_RAW
)

if (_BINDGEN_VERSION_RAW MATCHES "bindgen ([0-9]+)\\.([0-9]+)\\.([0-9]+)")
    set(Bindgen_VERSION_MAJOR "${CMAKE_MATCH_1}")
    set(Bindgen_VERSION_MINOR "${CMAKE_MATCH_2}")
    set(Bindgen_VERSION_PATCH "${CMAKE_MATCH_3}")
    set(Bindgen_VERSION "${Bindgen_VERSION_MAJOR}.${Bindgen_VERSION_MINOR}.${Bindgen_VERSION_PATCH}")
else()
    message(
        FATAL_ERROR
        "Failed to parse bindgen version. `bindgen --version` evaluated to (${_BINDGEN_VERSION_RAW})")
endif()

find_package_handle_standard_args(
    Bindgen
    REQUIRED_VARS Bindgen_EXECUTABLE
    VERSION_VAR Bindgen_VERSION
)

add_executable(Rust::Bindgen IMPORTED GLOBAL)
set_property(
    TARGET Rust::Bindgen
    PROPERTY IMPORTED_LOCATION ${Bindgen_EXECUTABLE}
)