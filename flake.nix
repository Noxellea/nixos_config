{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
nixvim = {
	url = "github:nix-community/nixvim";
	};
  };

  outputs ={
	self, 
	nixpkgs, 
	home-manager, 
	nixvim,
	...}@inputs: 
	{
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	#extraSpecialArgs = { inherit inputs; };
	modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
		
		#extraSpecialArgs = { inherit inputs; };		

              sharedModules = [
                inputs.nixvim.homeModules.nixvim
              ];

              users.noelles = import ./home.nix;

            };
    }
		./configuration.nix
		];

  };
};
}
