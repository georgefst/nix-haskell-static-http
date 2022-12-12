{
  description = "Haskell static HTTP server";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        haskellPackages = pkgs.haskellPackages;
      in
      {
        devShell = pkgs.mkShell {
          packages = [ (haskellPackages.ghcWithPackages (p: [ p.wai-app-static ])) ];
        };
      }
    );
}
