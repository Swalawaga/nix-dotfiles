#Hola
{ config, pkgs, ... }:

let
    nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #import "${home-manager}/nixos")
      /home/swalawaga/nixos/packages.nix
      /home/swalawaga/nixos/home.nix
    ];

  #Allow unfree packages cause Im not insane
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/New_York";

  networking.networkmanager.enable = true; 

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };


  #Nvidia Settings
  environment.systemPackages = [ nvidia-offload ];
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
     
    #powerManagement = {
        #enabled = true;

        #finegrained = true; #maybe comment this out idk what it does
    #};

    #uses beta drivers
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    #Fixes a glitch
    nvidiaPersistenced = true;
    #Required for amdgpu and nvidia gpu pairings
    modesetting.enable = true;
    prime = {
        offload.enable = true;
        #sync.enable = true;
  
        amdgpuBusId = "PCI:5:0:0";

        nvidiaBusId = "PCI:1:0:0";
    };
  };
    
  #Automatic garbage collection
  nix.gc.automatic = true;
  xdg.portal.enable = true;
  programs.dconf.enable = true;
  nixpkgs.config.allowNonFree = true;
  programs.steam.enable = true;
  hardware.opengl.driSupport32Bit = true;
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    libinput.touchpad.naturalScrolling = true;
    libinput.touchpad.middleEmulation = false;
    libinput.touchpad.tapping = true;
    libinput.touchpad.clickMethod = "clickfinger";
    libinput.touchpad.horizontalScrolling = false;
    libinput.touchpad.disableWhileTyping = true;
    #desktopManager.xfce.enable = true;
  };


  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  programs.zsh.enable = true;
  users.users.swalawaga = {
   isNormalUser = true;
   shell = pkgs.zsh; #makes zsh the default shell for swalawaga
   extraGroups = [ "wheel" "video"]; # Enable ‘sudo’ for the user.
  };
  #services.sshd.enable = true; #enables ssh
  
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  system.stateVersion = "unstable";
}

