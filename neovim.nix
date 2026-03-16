{ nvim-config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		extraPackages = with pkgs; [
			tree-sitter
			gcc
			nodejs
			ripgrep
			fd
			cargo
		];
	};
	xdg.configFile.nvim.source = nvim-config;
}
