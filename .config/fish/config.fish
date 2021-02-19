# Exports
# set --export GTK_THEME "phocus"
set --export XDG_SESSION_TYPE "wayland"
set --export XDG_CURRENT_DESKTOP "sway"
set --export MOZ_ENABLE_WAYLAND 1
set --export MOZ_USE_XINPUT2 1
set --export CLUTTER_BACKEND "wayland"

# set --export GDK_BACKEND "wayland"
set --export GRIM_DEFAULT_DIR "/home/okt/pics/snap"
set --export SBT_OPTS "-Xms512m -Xmx1536m -Xss2m"
set --export FZF_DEFAULT_COMMAND 'fd --type f --color=never'
set --export FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set --export FZF_ALT_C_COMMAND 'fd --type d . --color=never'
set --export FZF_CTRL_T_OPTS "--preview 'bat --color=always --line-range :500 {}'"
set --export FZF_ALT_C_OPTS "--preview 'tree -C {} | head -100'"
set --export FZF_COMPLETION_TRIGGER '@@'
set --export FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS'
  --color fg:-1,bg:-1,hl:#fabd2f,fg+:-1,bg+:-1,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
  '

# Aliases
alias l='colorls --sd --dark'
alias ls='colorls --sd -A --dark'
alias ll='colorls -l -t --dark --sd'
alias la='colorls -lA --dark --sd'
alias lc='colorls -lA --dark --sd --tree'
alias fbr='git checkout (git branch | fzf | string trim)'
alias fdbr='git branch -D (git branch | fzf | string trim)'
alias fgl='fzf_git_log'
alias chrome='open -a "Google Chrome"'
alias fsrc='source ~/.config/fish/config.fish'
alias fishrc='nano ~/.config/fish/config.fish'
alias repo='cd ~/repo'

alias config='/home/okt/.nix-profile/bin/git --git-dir=$HOME/.config/.dots/ --work-tree=$HOME'

# ~/.config/fish/config.fish
set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/.emacs.d/bin" $PATH;

set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  exec sway
end

# disable the fish greeting message.
# overwrite var with blank.
set fish_greeting

# starship prompt setup
starship init fish | source
