PROMPT='%(?/%{[0m[34;1m%}%m%{[0m%}/%{[0m[31;1m%}error%{[0m%})%# '

setopt autocd correct extendedglob nobeep prompt_subst

export LS_OPTIONS='--color=auto'
eval `dircolors`

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias la='ls -A'
alias lsd='ls -d'

alias md=mkdir
alias rd=rmdir

#cdpath=(/ /etc)

autoload -U compinit
compinit
zmodload -i zsh/complist
zmodload -i zsh/computil
zstyle ':completion:*' menu yes select
zstyle ':completion:*:rm:*' ignore-line yes
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

# begin noglob magic
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
zstyle -e :urlglobber url-other-schema \
	'[[ $words[1] == scp ]] && reply=("*") || reply=(http https ftp)'
# end noglob magic

test -f /etc/global && . /etc/global
test -f ~/.shellrc && . ~/.shellrc
test -f ~/.zprompt && . ~/.zprompt
test -f /etc/zsh/zkeys && . /etc/zsh/zkeys
test -f ~/.zkeys && . ~/.zkeys

typeset -AHg TFX TFG TBG
TFX=(
    reset     "[00m"
    bold      "[01m" no-bold      "[22m"
    italic    "[03m" no-italic    "[23m"
    underline "[04m" no-underline "[24m"
    blink     "[05m" no-blink     "[25m"
    reverse   "[07m" no-reverse   "[27m"
)
for color in {000..255}; do
    TFG[$color]="[38;5;${color}m"
    TBG[$color]="[48;5;${color}m"
done
TFG[prom]="$TFG[226]"

function _tsepdashes {
	perl -e "print '-' x $1"
}

function tsep {
	local tlen twidth dlenl dlenr
	if [ $# -gt 0 ]; then
		tlen=${#1}
		(( twidth = COLUMNS - tlen - 2 ))
		(( dlenl = twidth / 2 ))
		(( dlenr = twidth - dlenl ))
		echo "$TFG[$2]$(_tsepdashes $dlenl) $1 $(_tsepdashes $dlenr)$TFX[reset]"
	else
		echo "$TFG[$2]$(_tsepdashes $COLUMNS)$TFX[reset]"
	fi
}

stty -ixon

true
