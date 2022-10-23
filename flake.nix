{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/21.11";

    flake-utils.url = "github:numtide/flake-utils";

    dfinity-sdk = {
      url = "github:paulyoung/nixpkgs-dfinity-sdk?rev=6a6243a5f4625f0fe3ee253342764b137356a30e";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, dfinity-sdk }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: (import dfinity-sdk) final prev)
          ];
        };

        dfinitySdk = (pkgs.dfinity-sdk {
          acceptLicenseAgreement = true;
          sdkSystem = system;
        }).makeVersionFromManifest {
          systems = {
            "x86_64-darwin" = {
              sha256 = "sha256-0dmrknkFJ5UrGYqL2aH6xuUPJFlY6ae+4faHeF5rJBw=";
            };
            "x86_64-linux" = {
              sha256 = pkgs.lib.fakeSha256;
            };
          };
          version = "0.11.2";
        };
      in
        {
          # `nix develop`
          devShell = pkgs.mkShell {
            buildInputs = [
              dfinitySdk
            ];
          };
        }
    );
}
