defmodule RustCrypto do
  use Rustler, otp_app: :elixir_rust_nif_example, crate: "rustcrypto"

  # When NIF is loaded, Rustler will override this functions.
  def sha256(_arg1), do: exit(:nif_not_loaded)
end
