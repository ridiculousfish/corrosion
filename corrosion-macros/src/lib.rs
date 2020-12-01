extern crate proc_macro;
use proc_macro::TokenStream;

#[proc_macro]
pub fn import_bindings(_item: TokenStream) -> TokenStream {
    std::env::var("CORROSION_BINDING_FILES")
        .expect("Not running in a Corrosion build directory")
        .split(";")
        .map(|file| format!("include!(\"{}\");", file))
        .collect::<Vec<_>>()
        .join("\n")
        .parse()
        .unwrap()
}
