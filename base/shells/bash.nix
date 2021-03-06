{ config, pkgs, lib, ... }: with lib;
{ config = mkIf config.fnctl2.enable {

  programs.bash = {
    enableCompletion = true;
    shellAliases     = (import ./aliases.nix {inherit config pkgs lib;});

    shellInit = concatStringsSep "\n" [
      "eval \"$(${pkgs.direnv}/bin/direnv hook bash)\""
    ];

    interactiveShellInit = concatStringsSep "\n" [
      "[[ \"$TERM\" != \"xterm-kitty\" ]] || export TERM=\"xterm-256color\""
      "export PATH=\"$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH\""
      "function source_if_exists(){ test ! -e $1 || source $1 ;}"
      "source_if_exists $HOME/.bashrc.local"
      "source_if_exists $HOME/.aliases.local"
    ];

  };

}; }

