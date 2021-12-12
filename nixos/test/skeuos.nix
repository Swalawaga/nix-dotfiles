#Automatic install of skeuos test
{ lib, stdenv, fetchFromGitHub, gtk-engine-murrine }:

let
  themeName = "Skeuos";
  version = "2.0";
in
stdenv.mkDerivation {
  pname = "Skeuos";
  inherit version;

  src = fetchFromGitHub {
    owner = "daniruiz";
    repo = "skeuos-gtk";
    rev = "v${version}";
    sha256 = "0wrmqg96a6hsh5ylrf1bxrp66jjmnmi0spnc7xrfhwmjw04nhs6g";
  };

  propagatedUserEnvPkgs = [
    gtk-engine-murrine
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes/${themeName}
    cp -a {assets,cinnamon,gnome-shell,gtk-2.0,gtk-3.0,gtk-3.20,index.theme,metacity-1,unity,xfwm4} $out/share/themes/${themeName}
    cp -a kde/{color-schemes,plasma} $out/share/
    cp -a kde/kvantum $out/share/Kvantum
    mkdir -p $out/share/aurorae/themes
    cp -a kde/aurorae/* $out/share/aurorae/themes/
    mkdir -p $out/share/sddm/themes
    cp -a kde/sddm/* $out/share/sddm/themes/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Skeuos Gtk";
    homepage = "https://github.com/daniruiz/skeuos-gtk";
    license = licenses.gpl3;
    platforms = platforms.all;
    maintainers = with maintainers; [ alexarice ];
  };
}
