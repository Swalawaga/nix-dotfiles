#Hola
{config, pkgs, ... }:
#let
    #home-manager = builtins.fetchTarball  "https://github.com/nix-community/home-manager/archive/master.tar.gz";
#in
{
#imports = [
  #(import "${home-manager}/nixos")
#];
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
  dmenu
  rofi
  wofi
  wirelesstools
  i3status
  networkmanagerapplet
  #(steam.override {nativeOnly = false; extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ];})
  steam
  kitty
  pywal
  tty-clock
  conky
  lxappearance
  dunst
  xorg.xbacklight
  zsh
  htop
  picom
  discord
  feh
  pcmanfm
  polybar
  tela-icon-theme
  libnotify
  spotify
  scrot
  cava
  tor-browser-bundle-bin
];
}
