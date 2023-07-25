#================================================
# cp.bashrc
#================================================

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Ensure proper colors
export TERM="xterm-256color"

#neofetch

# Use vim keybindings:
set -o vi
# Ignore case when Tab completing
bind "set completion-ignore-case on"

# Bash history
HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignorespace:erasedups

# Set manpager
#================================================
# Uncomment only one of these!
#------------------------------------------------
# Vim as manpager
# See :help manpager.vim
# Move to the start and end of functions with [[ and ]] 
# Move around comments with ]" and ["
export MANPAGER="vim -M +MANPAGER -"

# Prompt
#================================================
# Warm colors
#export PS1="\[$(tput setaf 5)\][\D{%m/%d}]\[$(tput setaf 9)\]cp\[$(tput setaf 3)\]@\[$(tput setaf 11)\]\h \[$(tput setaf 7)\]\w \[$(tput setaf 10)\]\n$\[$(tput sgr0)\] "
# Cool Colors
#export PS1="\[$(tput setaf 8)\][\D{%m/%d}]\[$(tput setaf 5)\]cp\[$(tput setaf 13)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 12)\]\w \[$(tput setaf 10)\]\n->\[$(tput sgr0)\] "
# Minimal
export PS1="\[$(tput setaf 5)\]\w \[$(tput setaf 10)\]>\[$(tput sgr0)\] "
#
# Clrs:Dk Lt
# Bkg:  0  8
# Red:  1  9
# Grn:  2 10
# Ylw:  3 11
# Blu:  4 12
# Prp:  5 13
# Cyn:  6 14
# Fgd:  7 15

# Shopt
#================================================
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s histappend # do not overwrite history

# Aliases
#================================================
# alias <my_alias>='longer_command'
# Find most common commands using: 
#$ history | awk '{cmd[$2]++} END {for(elem in cmd) {print cmd[elem] " " elem}}' | sort -n -r | head -10

# Change default ls behavior
#------------------------------------------------
alias ls='ls -lh --color=auto'
alias ll='ls -lah --color=auto'

# Common `tree` commands
#------------------------------------------------
alias lt='tree -C ./'        # View tree of all files. May be slow.
alias ltd='tree -dC ./'      # View tree of directories only
alias lt2='tree -C -L 2 ./'  # View tree with depth of 2
alias lt3='tree -C -L 3 ./'  # View tree with depth of 3

# Conform before overwriting something
#------------------------------------------------
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Faster navigation to config files
#------------------------------------------------
alias cdconfig='cd $HOME/config-repo/ && ll'
alias vimrc='vim $HOME/config-repo/vim/.vimrc'
alias bashrc='vim $HOME/config-repo/bash/.bashrc'

# Shutdown
#------------------------------------------------
alias restart='shutdown -r now'

# Grep
#------------------------------------------------
alias grep='grep --color=auto'
alias fontgrep='fc-list | grep -i --color=auto'

# Pacman
#------------------------------------------------
alias pacupdate='pacman -Syu'
alias pacsearch='pacman -Ss'

# yt download
#------------------------------------------------
alias yta-best='yt-dlp --extract-audio --audio-format best'
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3'
alias ytv-best='yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 '

# Fetch
#------------------------------------------------
alias fetch='clear && neofetch'

# Git
#------------------------------------------------
alias gstat='git status'
alias gdiff='git diff --staged'			#Diff unadded changes
alias gcommit='git commit -m'
alias gpush='git push -u origin main'
