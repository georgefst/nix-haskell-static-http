Run a static HTTP server with `nix run github:georgefst/nix-haskell-static-http`.

Ideally it'd be possible to create an ad-hoc one-liner with `nix shell`, without needing a `flake.nix`, but this doesn't yet seem to be possible. Unlike with the old `nix-shell`, it's hard to get Haskell libraries in to scope in GHCI.
