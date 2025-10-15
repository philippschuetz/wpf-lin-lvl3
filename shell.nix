{pkgs ? import <nixpkgs> {}, ...}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    EDITOR = "vim";
    nativeBuildInputs = with pkgs; [
      nix
      git
      vim
      tmux
    ];
  };
}
