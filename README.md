Run a static HTTP server with `nix run github:georgefst/nix-haskell-static-http`. Or even pin a specific commit with e.g. `nix run github:georgefst/nix-haskell-static-http/fb5b6bc09dc3bf96647d8c641aa0124eebfa8246`.

Ideally it'd be possible to create an ad-hoc one-liner with `nix shell`, without needing a `flake.nix`, but this doesn't yet seem to be possible. Unlike with the old `nix-shell`, it's hard to get Haskell libraries in to scope in GHCI.
