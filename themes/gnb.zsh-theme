if [[ -n $SSH_CONNECTION ]]; then
	hn='%m '
else
	hn=''
fi
echo $hn
PROMPT='%{$fg_bold[yellow]%}$hn%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

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

alias b1w='ssh www@localhost -p8011'
alias b2w='ssh www@localhost -p8022'
alias b1g='ssh grahamb@localhost -p8011'
alias b2g='ssh grahamb@localhost -p8022'
alias kickstart='sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent'
alias uno='ssh -p2225 zimbra@localhost'
alias alpha='ssh -p2223 zimbra@localhost'
alias omega='ssh zimbra@omega.its.sfu.ca'
alias pushitunes='killall iTunes ; ssh home.grahamballantyne.com killall iTunes ; rsync -avz --delete ~/Music/iTunes/ home.grahamballantyne.com:~/Music/iTunes/'
alias pullitunes='killall iTunes ; ssh home.grahamballantyne.com killall iTunes ; rsync -avz --delete home.grahamballantyne.com:~/Music/iTunes/ ~/Music/iTunes/'
export NODE_PATH="/usr/local/lib/node"