#a
{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

{
    imports = [
        (import "${home-manager}/nixos")
        /home/swalawaga/nixos/i3.nix
    ];

    home-manager.users.swalawaga = { ... }: {
        programs.home-manager.enable = true;
        home.username = "swalawaga";
        home.homeDirectory = "/home/swalawaga";
        programs.kitty = {
            enable = true;
            extraConfig = ''
            window_padding_width 10
            include ~/.cache/wal/colors-kitty.conf
            '';
        };
        #xsession.enable = true;
    };
}
