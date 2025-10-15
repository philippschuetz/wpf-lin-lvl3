{
  imports = [
    ./gc.nix
    ./locale.nix
    ./nix-ld.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;
}
