if [[ -n $SSH_CONNECTION ]]; then
	hn='%m '
else
	hn=''
fi

if [[ $TERM = screen* ]]; then
    screen="screen $STY "
else
    screen=''
fi

function prompt_char() {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo "→"
}

PROMPT='%{$fg[green]%}$screen%{$fg[yellow]%}$hn%{$fg[red]%}$(prompt_char)%{$fg[green]%}%p %{$fg[cyan]%}%c %{$fg[blue]%}$(git_prompt_info)%{$fg[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[yellow]%}↑"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_NO_REMOTES=" %{$fg[yellow]%}◊%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$reset_color%}("
SHA="%{}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=")%{$reset_color%}"

function battery_charge {
    echo `~/bin/batterycharge.py` 2>/dev/null
}

if [[ -f /Users/grahamb/bin/batterycharge.py ]]; then
	RPROMPT='$(battery_charge)'
fi

alias kickstart='sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent'
export NODE_PATH="/usr/local/lib/node"
if [[ -f ~/.local_aliases ]]; then
	source ~/.local_aliases
fi

# Colorize the Terminal
export CLICOLOR=1;
