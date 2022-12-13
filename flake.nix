{
  description = "Haskell static HTTP server";

  inputs.nixpkgs.url = "nixpkgs/nixos-22.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        haskellPackages = pkgs.haskellPackages;
      in
      {
        apps.default = {
          type = "app";
          program = "${pkgs.writeShellScript "run server" ''
            ${haskellPackages.ghcWithPackages (p: [ p.wai-app-static ])}/bin/ghc -e \
              'putStrLn "Server starting..." >>
                Network.Wai.Handler.Warp.run 8000 (Network.Wai.Application.Static.staticApp
                  (Network.Wai.Application.Static.defaultFileServerSettings "."))'
          ''}";
        };
      }
    );
}
