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
            ${pkgs.haskellPackages.ghcWithPackages (p: [ p.wai-app-static ])}/bin/ghc -e \
              'putStrLn "Server starting on port ${port}..." >>
                Network.Wai.Handler.Warp.run ${port} (Network.Wai.Application.Static.staticApp
                  (Network.Wai.Application.Static.defaultFileServerSettings "."))'
          ''}";
        };
      }
    );
}
