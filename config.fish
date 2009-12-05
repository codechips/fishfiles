if status --is-login
  for dir in /bin /usr/bin /sbin /usr/sbin /usr/local/sbin /opt/local/sbin /opt/local/bin /usr/local/bin ~/bin ~/.config/fish/bin
    if test -d $dir
      set PATH $dir $PATH
    end
  end
end

set fish_greeting ""
set -x CLICOLOR 1

set MANPATH /opt/local/share/man:$MANPATH

set BROWSER open

set fish_color_cwd blue
set fish_color_uneditable_cwd red

# stops fish underlining valid paths... uses purple instead
set -U fish_color_valid_path purple --bold

set -g LC_TYPE=sv_SE.UTF-8
