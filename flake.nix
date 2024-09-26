{
  description = "Unofficial yuzu flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { nixpkgs, ... }:
  let
    # TODO: make a "forEachSystem"
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
    package = pkgs.callPackage (import ./nix { });
  in
  {
    packages.${system} = {
      default = package;
    };
  };
}
