#Configuration if I feel like running i3 I source this file
{ config, pkgs, ... }:

{
    services.xserver = {
        desktopManager = {
            xterm.enable = false;
        };
        displayManager = {
            defaultSession = "none+i3";
            lightdm = {
                enable = true;
                greeters.mini = {
                    enable = true;
                    user = "swalawaga";
                    extraConfig = ''
                        [greeter]
                        show-password-label = false;
                        [greeter-theme]
                        background-image = "/home/swalawaga/wallpapers/0018.jpg"
                    '';
                };
            };
        };
        windowManager.i3 = {
            enable = true;
            package = pkgs.i3-gaps;
            extraPackages = with pkgs; [
                kitty
                conky
                dunst
                polybar
                picom
                rofi
                dmenu
                tela-icon-theme
                i3status
                i3lock
            ];
        };
    };

    #nixpkgs.overlays = [ (self: super: {
        #kitty = super.kitty.overrideAttrs (_: {
            #extraConfig = ''
            #include ~/.cache/wal/colors-kitty.conf
            #window_padding_width 10
            #'';
        #});
    #}) ];

    #users.users.swalawaga.packages = [
        #(pkgs.writeScriptBin "kitty" ''
        #exec ${pkgs.kitty}/bin/kitty -c "/home/swalawaga/.cache/wal/colors-kitty.conf"
        #'')
    #];
}
