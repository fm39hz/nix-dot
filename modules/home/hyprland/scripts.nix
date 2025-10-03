{...}: {
  # Deploy Hyprland helper scripts and library
  home.file = {
    # Library with helper functions (manage_focus, bring_window_to_current, etc.)
    ".config/hypr/lib.sh" = {
      source = ./lib.sh;
      executable = true;
    };

    # Browser launcher script (uses lib.sh manage_focus function)
    ".config/hypr/scripts/browser.sh" = {
      source = ./scripts/browser.sh;
      executable = true;
    };

    # Telegram launcher script
    ".config/hypr/scripts/telegram.sh" = {
      source = ./scripts/telegram.sh;
      executable = true;
    };

    # Hyprpanel launcher script
    ".config/hypr/scripts/hyprpanel.sh" = {
      source = ./scripts/hyprpanel.sh;
      executable = true;
    };

    # Volume control script
    ".config/hypr/scripts/volume.py" = {
      source = ./scripts/volume.py;
      executable = true;
    };
  };
}
