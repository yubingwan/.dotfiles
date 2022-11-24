#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history 
HISTFILE=~/.zsh_history

fortune | cowsay -pn # -f stegosaurus

source $HOME/.aliases

HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export BROWSER="brave"

# plugins
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/exa"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
# plug "zap-zsh/zap-prompt"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-syntax-highlighting"

# keybinds
# bindkey ' ' autosuggest-accept

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi

vimwiki () {
    if [[ $# == 0 ]]
    then
        nvim +'VimwikiIndex'
    elif [[ $1 == 'git' ]]
    then
        git -C ~/vimwiki/ ${@:2}
    else
        echo 'Usage: vimwiki [git] [args ...]'
    fi
}

lvimwiki () {
    if [[ $# == 0 ]]
    then
        lvim +'VimwikiIndex'
    elif [[ $1 == 'git' ]]
    then
        git -C ~/vimwiki/ ${@:2}
    else
        echo 'Usage: vimwiki [git] [args ...]'
    fi
}

. /usr/share/autojump/autojump.sh

eval "$(zoxide init zsh)"

eval "$(starship init zsh)"
