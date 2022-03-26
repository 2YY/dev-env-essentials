if status is-interactive
and not set -q TMUX
  exec tmux
end

bind \t accept-autosuggestion
test -s "$HOME/.kiex/scripts/kiex.fish"; and source "$HOME/.kiex/scripts/kiex.fish"
starship init fish | source
