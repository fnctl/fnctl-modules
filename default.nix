{ nixos   ? (import <nixpkgs/nixos> {})
, config  ? nixos.config
, options ? nixos.options
, pkgs    ? nixos.pkgs
, lib     ? pkgs.lib
, ... }:

{ imports = [

    ./options
    ./base
    ./dev
    ./gui
    ./networking
    ./programs

]; }
