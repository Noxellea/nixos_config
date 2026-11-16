{
  description = "A very basic flake";

  nixConfig = {
    extra-substituters = [ "https://nyxintimenixvim.cachix.org" ];
    extra-trusted-substituters = [ "https://nyxintimenixvim.cachix.org" ];
    extra-trusted-public-keys = [
      "nyxintimenixvim.cachix.org-1:mQD2kN5KuO9yCNxDaoGCKtpm8MJiZGzdnRHwYSYNW3Q="
    ];

    trusted-users = [
      "root"
      "@wheel"
    ];
  };

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spotx-nix = {
      url = "github:SpotX-Official/SpotX-Nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/hyprland";
    nixvim-config.url = "github:NyxInTime/nixvim-config";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim-config,
      spotx-nix,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              #extraSpecialArgs = { inherit inputs; };

              users.noelles = import ./home.nix;

            };
          }
          ./configuration.nix
        ];

      };
    };
}
