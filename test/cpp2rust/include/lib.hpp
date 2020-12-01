#ifndef CPP2RUST_LIB_HPP_
#define CPP2RUST_LIB_HPP_

#ifdef __cplusplus
extern "C" {
#endif

void cpp_function(char const *name);

int cpp_add(int a, int b);

#ifdef __cplusplus
}
#endif

#endif