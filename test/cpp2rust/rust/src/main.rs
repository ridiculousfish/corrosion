corrosion::import_bindings!();

fn greeting(name: &str) {
    let name = std::ffi::CString::new(name).unwrap();
    unsafe {
        cpp_function(name.as_ptr());
    }
}

fn main() {
    println!("{}", unsafe { cpp_add(7, 8) });

    let args = std::env::args().skip(1).collect::<Vec<_>>();
    if args.len() >= 1 {
        greeting(&args[0]);
    } else {
        greeting("Rust");
    }
}
