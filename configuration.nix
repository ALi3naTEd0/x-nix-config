# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  #services.blueman.enable = true;

  # Enable Hyprland
  #programs.hyprland.enable = true;

  # Experimental Features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Merida";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Enable KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable XFCE Desktop Environment.
  #services.xserver.desktopManager.xfce.enable = true;
  #services.xserver.displayManager.defaultSession = "xfce";

  # Enable Pantheon Desktop Environment.
  #services.xserver.desktopManager.pantheon.enable = true;

  # Enable Cinnamon Desktop Environmet.
  #services.xserver.desktopManager.cinnamon.enable = true;

  # Enable MATE Desktop Environment.
  #services.xserver.desktopManager.mate.enable = true;

  # Enable LXQt Desktop Environment.
  #services.xserver.desktopManager.lxqt.enable = true;

  # Enable Deepin Dekstop Environment.
  #services.xserver.desktopManager.deepin.enable = true;

  # Enable Budgie Desktop Environment.
  #services.xserver.desktopManager.budgie.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.x = {
    isNormalUser = true;
    description = "x";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    anytype
    discord
    element-desktop
    enpass
    firefox
    flameshot
    fsearch
    gh
    gnome.gnome-disk-utility
    htop
    hypnotix
    jetbrains.idea-community
    keepass
    kid3
    libsForQt5.filelight
    localsend
    #logseq
    mediainfo
    mediainfo-gui
    neofetch
    mkvtoolnix
    nicotine-plus
    ntfs3g
    #(assert (lib.assertMsg (obsidian.version == "1.4.16") "obsidian: has wayland crash been fixed?");
    #  obsidian.override {
    #    electron = electron_24.overrideAttrs (_: {
    #      preFixup = "patchelf --add-needed ${libglvnd}/lib/libEGL.so.1 $out/bin/electron"; # NixOS/nixpkgs#272912
    #      meta.knownVulnerabilities = []; # NixOS/nixpkgs#273611
    #    });
    #  })
    plex
    plex-media-player
    python3
    python3Packages.deemix
    python3Packages.pypresence
    qbittorrent
    rclone
    rssguard
    rsync
    soulseekqt
    subtitleedit
    syncthing
    tauon
    telegram-desktop
    thunderbird
    uget
    vscode

    # KVM/QEMU
    bridge-utils
    dnsmasq
    ebtables
    libguestfs
    netcat-openbsd
    qemu_full
    vde2
    virt-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
