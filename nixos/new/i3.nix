#Configuration if I feel like running i3 I source this file
{ config, lib, pkgs, ... }:

{
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;

        config = rec {
            modifier = "Mod4";
            bars = [];

            window.border = 0;

            gaps = {
                inner = 15;
                outer = 5;
            };

            keybinds = lib.mkOptionDefault {
                "XF86AudioMute" = "exec amixer set Master toggle";
                "XF86AudioLowerVolume" = "exec amixer set Master 4%-";
                "XF86AudioRaiseVolume" = "exec amixer set Master 4%+";
                "XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
                "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";
                "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
                "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
                "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
                "${modifier}+Shift+return" = "exec ${pkgs.firefox}/bin/firefox";
                "${modifier}+p" = "exec ${pkgs.scrot}/bin/scrot";
            };

            startup = [
            {
              command = "exec bash /home/swalawaga/.config/polybar/launch.sh";
              always = true;
              notification = false;
            }
            {
              command = "exec xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal --rate 120 &";
              always = true;
              notification = false;
            }
            {
              command = "exec /home/swalawaga/.fehbg";
              always = true;
              notification = false;
            }
          ];
        };
    };
}
