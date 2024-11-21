{ pkgs, inputs, lib, ... }: {
  home.packages = let
    epicvim = inputs.epicvim.packages.${pkgs.system}.default.extend {
      config.clipboard.providers.wl-copy.enable = lib.mkForce false;
      config.clipboard.providers.xclip.enable = lib.mkForce true;
    };
  in [
    # editors
    epicvim

    # development
    pkgs.lazydocker
    pkgs.lazygit
    pkgs.go
    pkgs.exercism

    # utilities
    pkgs.wslu
    pkgs.fastfetch
    pkgs.ripgrep
    pkgs.eza
  ];
}
