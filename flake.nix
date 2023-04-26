{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            rustup
            wasm-bindgen-cli
            wasm-pack
            binaryen
            protobuf
          ];
        };
      }
    );
}
