{ pkgs, inputs, lib, ... }: {
  home.packages = let
    nvix = inputs.nvix.packages.${pkgs.system}.base.extend {
      config.colorschemes.tokyonight.settings.transparent = false;
      config.clipboard.providers.wl-copy.enable = lib.mkForce false;
      config.clipboard.providers.xclip.enable = lib.mkForce true;
      config.globals.copilot_browser = "C:\\Program Files\\Mozilla Firefox\\firefox.exe";
    };
  in [
    # editors
    nvix

    # development
    pkgs.lazydocker
    pkgs.lazygit

    # utilities
    pkgs.wslu
    pkgs.fastfetch
    pkgs.ripgrep
    pkgs.eza
  ];
}
