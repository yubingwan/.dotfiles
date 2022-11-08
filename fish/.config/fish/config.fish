eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

alias vim="nvim"
alias vi="nvim"
alias r="radian"
alias ntd="tmux new -s dockers"
alias atd="tmux a -t dockers"
alias atv="tmux a -t vpn"

# git commands
alias gmm="git merge master"
alias gmy="git merge yw"
alias gcm="git checkout master"
alias gcy="git checkout yw"

if type -q exa
   alias ll "exa -lah --long --header --icons"
   alias lt "exa --tree --level=2"
   alias llt "exa --tree --level=2 --long"
end

bind \t accept-autosuggestion

# set -g theme_display_git yes
# set -g theme_display_git_dirty yes
# set -g theme_display_git_untracked yes
# set -g theme_display_git_ahead_verbose yes
# set -g theme_display_git_dirty_verbose yes
# set -g theme_display_git_stashed_verbose yes
# set -g theme_display_git_default_branch yes
# set -g theme_git_default_branches master main
# set -g theme_git_worktree_support yes
# set -g theme_use_abbreviated_branch_name yes
# set -g theme_display_vagrant yes
# set -g theme_display_docker_machine yes
# set -g theme_display_k8s_context yes
# set -g theme_display_hg yes
# set -g theme_display_virtualenv no
# set -g theme_display_nix no
# set -g theme_display_ruby no
# set -g theme_display_node yes
# set -g theme_display_user ssh
# set -g theme_display_hostname ssh
# set -g theme_display_vi no
# set -g theme_display_date no
# set -g theme_display_cmd_duration yes
# set -g theme_title_display_process yes
# set -g theme_title_display_path no
# set -g theme_title_display_user yes
# set -g theme_title_use_abbreviated_path yes
# set -g theme_date_format "+%a %H:%M"
# set -g theme_date_timezone America/New_York
# set -g theme_avoid_ambiguous_glyphs yes
# set -g theme_powerline_fonts yes
# set -g theme_nerd_fonts yes
# set -g theme_show_exit_status yes
# set -g theme_display_jobs_verbose yes
# set -g default_user your_normal_user
# set -g theme_color_scheme nord
# set -g fish_prompt_pwd_dir_length 1
# set -g theme_project_dir_length 1
# set -g theme_newline_cursor yes
# set -g theme_newline_prompt '$ '
# set -g theme_vcs_ignore_paths /some/path /some/other/path{foo,bar}

starship init fish | source

begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end
