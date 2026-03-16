{
  description = "NixOS modules for https://github.com/TheWhale01/nixos-config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nvim-config = {
      url = "github:TheWhale01/nvim-config";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosModules = {
      default = { ... }: {
	specialArgs = { inherit inputs; };
        imports = [
          ./btop.nix
          ./git.nix
          ./neovim.nix
          ./zsh.nix
        ];
      };
    };
  };
}
