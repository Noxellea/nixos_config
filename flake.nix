{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs ={self, nixpkgs, home-manager, ...}: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              #sharedModules = [
               # inputs.nixvim.homeModules.nixvim
              #];

              users.noelles = import ./home.nix;

            };
          }
		./configuration.nix
		];

  };
};
}
