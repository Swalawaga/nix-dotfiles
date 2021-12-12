#Configuration For the pantheon desktop enviroment 
{ config, pkgs, ... }:

{
    services.xserver = {
        desktopManager = {
           pantheon.enable = true; 
        };
        displayManager = {
            lightdm.greeters.pantheon.enable = true;
            lightdm.enable = true;
        };
        #services.pantheon.apps.enable = false; #if you dont want to install the default applications
        #environment.pantheon.excludePackages You could also use this for specific packages
    };
}
