corrosion_add_crate(MANIFEST_PATH rust/Cargo.toml)
corrosion_link_libraries(rust-exe cpp-lib)

add_custom_command(
    OUTPUT cpp-lib.rs
    COMMAND $<TARGET_FILE:Rust::Bindgen> ${CMAKE_CURRENT_SOURCE_DIR}/include/lib.hpp -o cpp-lib.rs
    DEPENDS include/lib.hpp
)

add_custom_target(bindings DEPENDS cpp-lib.rs)

add_dependencies(cargo-build_rust-exe bindings)

add_library(cpp-lib lib.cpp include/lib.hpp)
target_include_directories(cpp-lib PUBLIC include)
target_compile_features(cpp-lib PRIVATE cxx_std_17)
set_target_properties(
    cpp-lib
    PROPERTIES
        POSITION_INDEPENDENT_CODE ON
)