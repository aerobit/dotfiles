{ pkgs, ...}:
{
  enable = true;
  hooks.postswitch = {
    "reload theme" = "${pkgs.pywal}/bin/wal -R";
  };
  profiles = {
    "home-4k" = {
      fingerprint = {
        eDP1 = "00ffffffffffff0006af362000000000001b0104a51f117802fbd5a65334b6250e505400000001010101010101010101010101010101e65f00a0a0a040503020350035ae100000180000000f0000000000000000000000000020000000fe0041554f0a202020202020202020000000fe004231343051414e30322e30200a00d2";
        DP2 = "00ffffffffffff000469a328490200001a1a0104b53e22783a1cb5a3574fa0270d5054bfef00d1c0814081809500b300714f81c001014dd000a0f0703e80302035006d552100001aa36600a0f0701f80302035006d552100001a000000fd001e5018a03c041100f0f838f03c000000fc0041535553205042323837510a20015702031c714f0102031112130414051f900e0f1d1e2309170783010000565e00a0a0a02950302035006d552100001ee26800a0a0402e60302036006d552100001a011d00bc52d01e20b82855406d552100001e8c0ad090204031200c4055006d552100001800000000000000000000000000000000000000000000000000000090";
      };
      config = {
        eDP1 = {
          enable = true;
          primary = true;
          mode = "2560x1440";
          position = "0x2160";
          rate = "60.01";
        };
        DP2 = {
          enable = true;
          mode = "3840x2160";
          position = "0x0";
          rate = "60.00";
        };
      };
    };
    "mobile" = {
      fingerprint.eDP1 = "00ffffffffffff0006af362000000000001b0104a51f117802fbd5a65334b6250e505400000001010101010101010101010101010101e65f00a0a0a040503020350035ae100000180000000f0000000000000000000000000020000000fe0041554f0a202020202020202020000000fe004231343051414e30322e30200a00d2";
      config.eDP1 = {
        enable = true;
        primary = true;
        mode = "2560x1440";
        position = "0x0";
        rate = "60.01";
      };
    };
    "work-4k" = {
      fingerprint = {
        eDP1 = "00ffffffffffff0006af362000000000001b0104a51f117802fbd5a65334b6250e505400000001010101010101010101010101010101e65f00a0a0a040503020350035ae100000180000000f0000000000000000000000000020000000fe0041554f0a202020202020202020000000fe004231343051414e30322e30200a00d2";
        DP2 = "00ffffffffffff0010acbd404c374547261b0104a53c22783aee95a3544c99260f5054a54b00d100d1c0b300a94081808100714f01014dd000a0f0703e803020350055502100001a000000ff0035344b4b4437394a4745374c0a000000fc0044454c4c205032373135510a20000000fd001d4b1f8c36010a202020202020019b02031df150101f200514041312110302161507060123091f0783010000a36600a0f0701f803020350055502100001a565e00a0a0a029503020350055502100001a023a801871382d40582c450055502100001e011d007251d01e206e28550055502100001e000000000000000000000000000000000000000000000000000013";
      };
      config = {
        eDP1 = {
          enable = true;
          primary = true;
          mode = "2560x1440";
          position = "0x2160";
          rate = "60.01";
        };
        DP2 = {
          enable = true;
          mode = "3840x2160";
          position = "0x0";
          rate = "60.00";
        };
      };
    };  };
}