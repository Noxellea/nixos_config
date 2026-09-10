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
      rebuild = "sudo nixos-rebuild switch --flake /home/noelles/.config/nixos/";
      update = "sudo nix flake update --flake /home/noelles/.config/nixos/";

    };
  };
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "noxellea";
        email = "lesixxalive@gmail.com";
      };
      init.defaultBranch = "main";
    };
    extraConfig = {
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
  };
}
