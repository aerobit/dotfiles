{ pkgs, ... }:

let
  theme = import ./theme.nix;
  i3blocks-git = import ./i3blocks;
  oomox = import ./oomox;
  git-quick-stats = import ./git-quick-stats;
  xwobf = import ./xwobf;
in
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # system utils
    htop
    xclip
    psmisc
    acpi
    sysstat
    lm_sensors
    file
    smartmontools
    graphviz
    toilet
    xorg.xev
    openssl
    rename
    usbutils
    ffmpeg
    pciutils

    # languages & build tools
    go
    gnumake
    lua
    tokei
    python
    python3Full
    cmake
    yarn
    nodejs-10_x
    ms-sys
    git-quick-stats
    awscli
    ansible
    swiProlog
    glslang
    rustup
    libimobiledevice

    # desktop env
    pywal
    i3status-rust
    i3lock
    gnome3.dconf
    maim
    pavucontrol
    feh
    libnotify
    inotify-tools
    xwobf
    blueman
    exa
    gitAndTools.git-extras

    # apps
    appimage-run
    google-chrome
    vscode
    kitty
    pcmanfm
    gnome3.eog
    gnome3.gucharmap
    neofetch
    woeusb
    simplescreenrecorder
    kicad
    gimp
    atom
    arduino
    xoscope
    vlc
    
    # chat
    weechat
    discord
  ];
  
  programs.home-manager = {
    enable = true;
    path = "https://github.com/rycee/home-manager/archive/release-18.03.tar.gz";
  };

  xsession = {
    enable = true;
    windowManager.i3 = import ./i3.nix pkgs;
  };
  programs.autorandr = import ./autorandr.nix pkgs;

  programs.rofi = import ./rofi.nix pkgs;
  services.dunst = import ./dunst.nix pkgs;
  services.compton = import ./compton.nix pkgs;
  programs.fish = {
    enable = true;
    shellAliases = {
      pbpaste = "xclip -selection clipboard -o";
      pbcopy = "xclip -selection clipboard -i";
      netcopy = "nc -q 0 tcp.st 7777 | grep URL | cut -d \" \" -f 2 | pbcopy";
      icat ="kitty +kitten icat";

      google-chrome  ="google-chrome-stable";
      chrome = "google-chrome";

      reload-fish = "exec fish";
      fix-bluetooth-audio = "pacmd set-card-profile (pacmd list-sinks | sed -n \"s/card: \\([0-9]*\\) <bluez.*/\\1/p\" | xargs) a2dp_sink";
    };
    shellInit = ''
      fundle plugin 'tuvistavie/fish-ssh-agent'
      fundle plugin 'MaxMilton/pure'

      set -gx VISUAL \"nano\"
      set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1

      set -gx PATH ~/.yarn/bin ~/bin ~/go/bin $PATH

      fundle init

      source (lua ~/bin/z.lua --init fish | psub)
      alias ls "exa"
    '';
  };
  programs.git = {
    enable = true;
    userEmail = "arilotter@gmail.com";
    userName = "Ari Lotter";
    extraConfig.core.editor = "code --wait";
    extraConfig.pull.rebase = true;
    extraConfig.rebase.autoStash = true;
    extraConfig.diff.tool = "default-difftool";
    extraConfig.push.default = "simple";
  };

  systemd.user.services.lock = {
    Unit = {
      Description = "Lock Screen When Sleeping";
      Before = [ "sleep.target" ];
    };
    Service = {
      Type = "forking";
      ExecStart = "${pkgs.maim} /tmp/screen.png && ${xwobf}/bin/xwobf -s 11 /tmp/screen.png && ${pkgs.i3lock}/bin/i3lock -i /tmp/screen.png && rm /tmp/screen.png";
      # ExecStartPost = "/run/current-system/sw/bin/sleep 1";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

}
