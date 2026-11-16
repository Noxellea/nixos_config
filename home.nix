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

  home.pkgs = with pkgs; [
    inputs.nixvim-config.packages.${pkgs.system}.default
  ];
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/noelles/.config/nixos/";
      update = "sudo nix flake update --flake /home/noelles/.config/nixos/";
      dawson-vpn = "sudo openfortivpn -c ~/.config/nixos/vpn-config.txt --saml-login";
      consume = "sudo nix-collect-garbage && nix-collect-garbage";
    };
  };
  home.packages = with pkgs; [
    github-desktop
  ];
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
      filer.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
}
