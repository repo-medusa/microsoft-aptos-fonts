{
  description = "A new font from Microsoft";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
  in {
    packages = forAllSystems (system: {
      microsoft-aptos-fonts = nixpkgsFor.${system}.kdePackages.callPackage ./package.nix {};
    });

    defaultPackage = forAllSystems (system: self.packages.${system}.microsoft-aptos-fonts);
  };
}
