{pkgs, ...}: {
  home.packages = with pkgs; [
    zsh
    thefuck
    carapace
  ];

  home.file."./.zshrc-personal".text = ''
    #!/usr/bin/env zsh

    # Editor configuration
    export EDITOR="nvim"
    export VISUAL="nvim"

    # Carapace completions
    export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
    zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
    source <(carapace _carapace)

    # thefuck integration
    eval $(thefuck --alias)

    # Custom aliases
    alias ff="fastfetch"
    alias tmz="~/.config/scripts/zj_project.sh"
    alias nvim_set_default="~/.config/scripts/nvim_default_picker.sh"
    alias nvim_direct_use="~/.config/scripts/nvim_direct_picker.sh"
    alias nvim_delete="~/.config/scripts/nvim_delete.sh"
    alias omzconfig="nvim ~/.zshrc-personal"
    alias tempnote="cd ~/Workspace/Notes/ && nvim TempNote.md"

    # Android Development environment
    export ANDROID_HOME="$HOME/Android/Sdk"
    export PATH=$PATH:$ANDROID_HOME/platform-tools/
    export PATH=$PATH:$ANDROID_HOME/tools/bin/
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/tools/
    alias aemu="emulator -avd Pixel_3a_API_34_extension_level_7_x86_64"

    # Flutter environment
    export CHROME_EXECUTABLE='thorium-browser'

    # GodotEnv environment
    alias godotenv="$HOME/.dotnet/tools/godotenv"
    export GODOT="$HOME/.config/godotenv/godot/bin/godot"
    export PATH="$HOME/.config/godotenv/godot/bin:$PATH"
  '';
}

