#Hola
{config, pkgs, ... }:
{
#Fonts
fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    siji
    noto-fonts-emoji
];

#This is to fix some issues with some packages
environment.pathsToLink = [ "/libexec" ];

#Packages
environment.systemPackages = with pkgs; [
  vim 
  wget
  curl
  neovim
  tmux
  neofetch
  nodejs
  git
  python
  firefox
  wirelesstools
  networkmanagerapplet
  #(steam.override {nativeOnly = false; extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ];})
  steam
  pywal
  tty-clock
  lxappearance
  zsh
  htop
  discord
  feh
  pcmanfm
  libnotify
  spotify
  scrot
  cava
  vlc
  xclip
  #libsForQt5.kdeconnect-kde
  tor-browser-bundle-bin
];
}
