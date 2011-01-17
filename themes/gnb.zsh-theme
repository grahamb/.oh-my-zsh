if [[ -n $SSH_CONNECTION ]]; then
	hn='%m '
else
	hn=''
fi
echo $hn
PROMPT='%{$fg_bold[red]%}$hn➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function battery_charge {
    echo `~/bin/batterycharge.py` 2>/dev/null
}

if [[ -f /Users/grahamb/bin/batterycharge.py ]]; then
	RPROMPT='$(battery_charge)'
fi