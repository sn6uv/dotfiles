# Check for an interactive session
[ -z "$PS1" ] && return

export EDITOR="vim"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias stealth='ssh -C2qTnN -D 8080 snuvcom@sn6uv.com & sleep 1; chromium --incognito --proxy-server=socks5://127.0.0.1:8080 http://www.whatismyip.com.au/'

alias skype='xhost +local: && sudo -u skype /usr/bin/skype'

# Enable tab completion for sudo
complete -cf sudo

case ${TERM} in
  xterm*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

#alias mutt='mutt; killall -SIGUSR1 conky'

# Unlimited stack
ulimit -s unlimited

# Source ifort
source /opt/intel/bin/compilervars.sh intel64

# XTerm Transparency
[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null
