{
  description = "mib's smol nixpkgs repo";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    clj-nix = {
      url = "github:jlesquembre/clj-nix";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, clj-nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        cljpkgs = clj-nix.packages."${system}";
        callPackage = pkgs.lib.callPackageWith (pkgs // { inherit cljpkgs; });
      in
      {
        packages = {
          maelstrom = callPackage ./maelstrom { };
        };
      });
}
