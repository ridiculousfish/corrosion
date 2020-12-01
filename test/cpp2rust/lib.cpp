#include <iostream>
#include <string_view>

#include <lib.hpp>

extern "C" void cpp_function(char const *name) {
    std::string_view const name_sv = name;
    std::cout << "Hello, " << name_sv << "! I'm C++!\n";
}

extern "C" int cpp_add(int a, int b) {
    return a + b;
}