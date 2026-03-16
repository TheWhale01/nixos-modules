{
  description = "NixOS modules for https://github.com/TheWhale01/nixos-config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nvim-config = {
      url = "github:TheWhale01/nvim-config";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nvim-config, ... }@inputs: {
    nixosModules = {
      default = { ... }: {
        _module.args = { inherit inputs; };
        imports = [
          self.nixosModules.btop
          self.nixosModules.git
          self.nixosModules.zsh
          self.nixosModules.neovim
        ];
      };
      btop = import ./btop.nix;
      git = import ./git.nix;
      zsh = import ./zsh.nix;
      neovim = {
        _module.args.nvim-config = nvim-config;
        imports = [
          ./neovim.nix
        ];
      };
    };
  };
}
