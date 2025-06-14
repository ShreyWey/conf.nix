{ pkgs, ... }:
{
  programs = {
    nix-ld.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  environment.systemPackages = with pkgs; [
    pinentry-curses
    whois
    file
    vim
    killall
    eza
    git
    unzip
    unrar
    pciutils
    usbutils
    ripgrep
    fd
    bat
    pkg-config
    nmap
    nh
    tree
    glib
    fzf
    zoxide
    zip
    fastfetch
    jq
    curl
    wget
    exiftool
    libqalculate
  ];

  services = {
    tzupdate.enable = true;
    upower.enable = true;
  };
}
