{
	config,
	pkgs,
	inputs,
	...
}:

{
	home.username = "noelles";
	home.homeDirectory = "/home/noelles";
	home.stateVersion = "26.05";

	imports = [
		./nixvim.nix
      ];
	programs.bash = {
    enable = true;  
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/nyx/.config/nixos/";
      update = "sudo nix flake update --flake /home/nyx/.config/nixos/";

    };
  };
}
