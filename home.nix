{
	config,
	pkgs,
	inputs,
	...
};

{
	home.username = "noelles";
	home.homeDirectory = "/home/noelles";
	home.stateVersion = "26.05";

	imports = [
		./../nixvim.nix
	];
}
