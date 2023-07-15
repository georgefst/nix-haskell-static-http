{
  description = "Haskell static HTTP server";

  inputs.nixpkgs.url = "nixpkgs/nixos-23.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        port = "8000";
      in
      {
        apps.default = {
          type = "app";
          program = "${pkgs.writeShellScript "run server" ''
            ${pkgs.haskellPackages.ghcWithPackages (p: [ p.lifx-lan ])}/bin/ghc -e \
              'print =<< Lifx.Lan.runLifx (Lifx.Lan.discoverDevices Nothing)'
          ''}";
        };
      }
    );
}
