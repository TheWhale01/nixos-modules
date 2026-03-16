{
  description = "NixOS modules for https://github.com/TheWhale01/nixos-config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules = {
      btop = import ./btop.nix;
      git = import ./git.nix;
      neovim = import ./neovim.nix;
      zsh = import ./zsh.nix;
      default = { ... }: {
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
