{
	description = "nixos";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
	};

	outputs = {
		self,
		nixpkgs,
		...
	}@inputs:
	{
		nixosConfiguration.nixos = nixpkgs.lib.nixosSystem {
			system = "x84_64-linux";
			modules = [
				./configuration.nix
				];
				
			};
		};
	}
