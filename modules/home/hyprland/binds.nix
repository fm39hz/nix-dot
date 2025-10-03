{host, ...}: let
  inherit
    (import ../../../hosts/${host}/variables.nix)
    browser
    terminal
    ;
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Terminal and basic apps
      "$modifier,Return,exec,uwsm app ${terminal}"
      "$modifier SHIFT,ESCAPE,exec,uwsm app kitty -e btop"
      "$modifier,K,exec,list-keybinds"
      "$modifier SHIFT,Return,exec,rofi-launcher"

      # Rofi launcher with uwsm integration
      "$modifier,SPACE,exec,rofi -show drun -run-command \"uwsm app {cmd}\""

      # Screenshot bindings
      ",PRINT,exec,uwsm app hyprshot -m output -o ~/Pictures/ScreenShots"
      "SHIFT,PRINT,exec,uwsm app hyprshot -m region -o ~/Pictures/ScreenShots"
      "$modifier,PRINT,exec,uwsm app hyprshot -m window -o ~/Pictures/ScreenShots"
      "$modifier,S,exec,~/.config/hypr/scripts/hyprpanel.sh"

      # Web and search
      "$modifier SHIFT,W,exec,web-search"
      "$modifier,W,exec,${browser}"
      "$modifier CTRL,B,exec,~/.config/hypr/scripts/browser.sh"

      # Utilities
      "$modifier,Y,exec,kitty -e yazi"
      "$modifier,E,exec,emopicker9000"
      "$modifier SHIFT,N,exec,swaync-client -rs"
      "$modifier ALT,W,exec,wallsetter"

      # Applications
      "$modifier,D,exec,discord"
      "$modifier,O,exec,obs"
      "$modifier,C,exec,hyprpicker -a"
      "$modifier,G,exec,gimp"
      "$modifier CTRL,C,exec,~/.config/hypr/scripts/telegram.sh"
      "$modifier CTRL,U,exec,uwsm app kitty -e ~/.config/scripts/system_update.sh"

      # Special workspaces
      "$modifier,P,togglespecialworkspace,scratchpad"
      "$modifier SHIFT,P,split:movetoworkspace,special:scratchpad"
      "$modifier,B,togglespecialworkspace,browser"
      "$modifier SHIFT,B,split:movetoworkspace,special:browser"

      # Window management
      "$modifier,T,exec,pypr toggle term"
      "$modifier,M,split:swapactiveworkspaces,current +1"
      "$modifier,G,split:grabroguewindows"
      "$modifier,TAB,exec,hyprctl dispatch overview:toggle"
      "$modifier,BACKSPACE,killactive,"
      "$modifier SHIFT,BACKSPACE,exec,hyprctl kill"
      "$modifier,pseudo,pseudo,"
      "$modifier SHIFT,I,togglesplit,"
      "$modifier,F,togglefloating,"
      "$modifier SHIFT,F,fullscreen,"
      "$modifier ALT,F,workspaceopt,allfloat"
      "$modifier SHIFT,C,exit,"

      # Logout/lock
      "$modifier,ESCAPE,exec,pidof wlogout || uwsm app wlogout"
      "ALT,ESCAPE,exec,uwsm app hyprpanel toggleWindow dashboardmenu"

      # Volume and media controls
      "$modifier SHIFT,V,exec,python ~/.config/hypr/scripts/volume.py"

      # Move window
      "$modifier SHIFT,left,movewindow,l"
      "$modifier SHIFT,right,movewindow,r"
      "$modifier SHIFT,up,movewindow,u"
      "$modifier SHIFT,down,movewindow,d"
      "$modifier SHIFT,H,movewindow,l"
      "$modifier SHIFT,L,movewindow,r"
      "$modifier SHIFT,K,movewindow,u"
      "$modifier SHIFT,J,movewindow,d"

      # Swap window
      "$modifier ALT,left,swapwindow,l"
      "$modifier ALT,right,swapwindow,r"
      "$modifier ALT,up,swapwindow,u"
      "$modifier ALT,down,swapwindow,d"
      "$modifier ALT,43,swapwindow,l"
      "$modifier ALT,46,swapwindow,r"
      "$modifier ALT,45,swapwindow,u"
      "$modifier ALT,44,swapwindow,d"

      # Move focus
      "$modifier,left,movefocus,l"
      "$modifier,right,movefocus,r"
      "$modifier,up,movefocus,u"
      "$modifier,down,movefocus,d"
      "$modifier,H,movefocus,l"
      "$modifier,L,movefocus,r"
      "$modifier,K,movefocus,u"
      "$modifier,J,movefocus,d"

      # Resize windows
      "$modifier CTRL,H,resizeactive,-40 0"
      "$modifier CTRL,L,resizeactive,40 0"
      "$modifier CTRL,K,resizeactive,0 -40"
      "$modifier CTRL,J,resizeactive,0 40"
      "$modifier CTRL,left,resizeactive,-10 0"
      "$modifier CTRL,right,resizeactive,10 0"
      "$modifier CTRL,up,resizeactive,0 -10"
      "$modifier CTRL,down,resizeactive,0 10"

      # Workspaces
      "$modifier,1,split:workspace,1"
      "$modifier,2,split:workspace,2"
      "$modifier,3,split:workspace,3"
      "$modifier,4,split:workspace,4"
      "$modifier,5,split:workspace,5"
      "$modifier,6,split:workspace,6"
      "$modifier,7,split:workspace,7"
      "$modifier,8,split:workspace,8"
      "$modifier,9,split:workspace,9"
      "$modifier,0,split:workspace,10"

      # Workspace navigation
      "$modifier ALT,H,split:workspace,e-1"
      "$modifier ALT,L,split:workspace,e+1"
      "$modifier SHIFT CTRL,H,split:workspace,e-1"
      "$modifier SHIFT CTRL,L,split:workspace,e+1"
      "$modifier,mouse_left,split:workspace,e-1"
      "$modifier,mouse_right,split:workspace,e+1"
      "$modifier CONTROL,right,workspace,e+1"
      "$modifier CONTROL,left,workspace,e-1"
      "$modifier,mouse_down,workspace,e+1"
      "$modifier,mouse_up,workspace,e-1"

      # Move to workspace
      "$modifier SHIFT,1,split:movetoworkspace,1"
      "$modifier SHIFT,2,split:movetoworkspace,2"
      "$modifier SHIFT,3,split:movetoworkspace,3"
      "$modifier SHIFT,4,split:movetoworkspace,4"
      "$modifier SHIFT,5,split:movetoworkspace,5"
      "$modifier SHIFT,6,split:movetoworkspace,6"
      "$modifier SHIFT,7,split:movetoworkspace,7"
      "$modifier SHIFT,8,split:movetoworkspace,8"
      "$modifier SHIFT,9,split:movetoworkspace,9"
      "$modifier SHIFT,0,split:movetoworkspace,10"

      # Alt-Tab
      "ALT,Tab,cyclenext"
      "ALT,Tab,bringactivetotop"
    ];

    # Media key bindings with repeating
    binde = [
      ",XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +1%"
      ",XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -1%"
    ];

    # Lock bindings (trigger on key release)
    bindl = [
      ",XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle"
      ",XF86AudioPlay,exec,playerctl play-pause"
      ",XF86AudioPrev,exec,playerctl previous"
      ",XF86AudioNext,exec,playerctl next"
    ];

    # Brightness with hyprsunset
    bindel = [
      ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
      ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
    ];

    # Mouse bindings
    bindm = [
      "$modifier,mouse:272,movewindow"
      "$modifier,mouse:273,resizewindow"
    ];
  };
}
