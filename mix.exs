defmodule ElixirRustNifExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_rust_nif_example,
      version: "0.1.0",
      elixir: "~> 1.5",
      rustler_crates: rustler_crates(), # Define Rust crates
      compilers: [:rustler] ++ Mix.compilers, # Add compiler for the native Rust code
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # dependency for https://docs.rs/rustler/
      {:rustler, "~> 0.10.1"}
    ]
  end


  defp rustler_crates do
    [
      rustcrypto: [
        path: "native/rustcrypto",
        mode: (if Mix.env == :prod, do: :release, else: :debug),
      ]
    ]
  end
end
