#[macro_use]
extern crate rustler;
#[macro_use]
extern crate rustler_codegen;
#[macro_use]
extern crate lazy_static;
extern crate crypto;

use self::crypto::digest::Digest;
use self::crypto::sha2::Sha256;
use rustler::{NifEnv, NifTerm, NifResult, NifEncoder};

mod atoms {
    rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler_export_nifs! {
    "Elixir.RustCrypto",
    [
        ("sha256", 1, sha256)
    ],
    None
}

fn sha256<'a>(env: NifEnv<'a>, args: &[NifTerm<'a>]) -> NifResult<NifTerm<'a>> {
    let param: String = try!(args[0].decode());

    let mut hasher = Sha256::new();
    hasher.input_str(param.as_str());

    Ok((atoms::ok(), hasher.result_str()).encode(env))
}
