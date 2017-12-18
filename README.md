# ElixirRustNifExample

**Simple example how to use NIF built with Rust in Elixir code**

## Instruction
* Install Rust from official website (https://www.rust-lang.org/)
* Install Elixir with Erlang OTP (http://elixir-lang.github.io/install.html)
* Clone the project.
```shell
$ git clone https://github.com/damalmax/elixir_rust_nif_example.git
```
* Get dependencies with mix.
```shell
$ mix deps.get
```
* Run Elixir REPL with the following command:
```shell
$ iex -S mix
```
* Once REPL is started you can use `sha256/1` function delegated to Rust:
```shell
iex(0)> RustCrypto.sha256("some text")
{:ok, "b94f6f125c79e3a5ffaa826f584c10d52ada669e6762051b826b55776d05aed2"}
```

