{ config, lib, options, pkgs, ... }: {

  imports = [
    ./sysctl.nix
    ./sniffers.nix
  ];

}