{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
    shellAliases = {
      cd = "z";
      n = "nvim";
      hms = "home-manager switch --flake ~/wsl-home";
      ls = "${pkgs.eza}/bin/eza";
    };
    initExtra = ''
       if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
       fi

       export PATH=$HOME/.cargo/bin:$PATH

       # BUN
       export BUN_INSTALL="$HOME/.bun"
       export PATH="$BUN_INSTALL/bin:$PATH"

       # GO
       export GOPATH="$HOME/go/bin"
       export PATH="$GOPATH:$PATH"

       export PATH="$HOME/.local/bin:$PATH"
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
