
# Input line
PS1="\[\033[0;33m\]\h@\u:\l \[\033[1;37m\]\w \n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_o\[\e[0m\]; fi\`\\$ "

# For correcting misprint in command argument. For example: form cd /user to cd /usr
shopt -s cdspell
# For correcting misprint in command argument. For example: form cd /Usr to cd /usr
shopt -s nocaseglob

export EDITOR=vim

alias git_ac='git add . && git commit -a -m'

alias ls='ls --color=auto'
alias ll='ls -lah'

alias grep='grep --color=yes'

# Convert to jpg
alias tojpg='mogrify -format jpg $1'

export ip_snaifServer="77.91.195.205"
alias con="ssh root@192.168.52.3"
alias con_snaifServer="ssh -p 2002 snaiffer@$ip_snaifServer"
alias con_snaifServer_test="ssh snaiffer@192.168.51.51"

#PATH="$PATH:/usr/local/bin/pmanage/"
