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
# Set default editor to Vim
export EDITOR=vim

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

# Prompt: Bash
#================================================
#export PS1="\[$(tput setaf 5)\]\w \[$(tput setaf 10)\]->\[$(tput sgr0)\] "
export PS1="\[$(tput setaf 5)\]\u\[$(tput setaf 10)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 5)\]\w \[$(tput setaf 10)\]->\[$(tput sgr0)\] "

# Variables:
#------------------------------------------------
# Date: \D{%m/%d}
# User: \u
# Host: \h
# Working directory: \w

# Colors:
#------------------------------------------------
#| Clr: | Dk | Lt |
#|------|----|----|
#| Bkg: |  0 |  8 |
#| Red: |  1 |  9 |
#| Grn: |  2 | 10 |
#| Ylw: |  3 | 11 |
#| Blu: |  4 | 12 |
#| Prp: |  5 | 13 |
#| Cyn: |  6 | 14 |
#| Fgd: |  7 | 15 |

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

# Package manager: Pacman
# TODO Update for paru package manager
#------------------------------------------------
alias pacu='pacman -Syu'				# Update
alias pacl='pacman -Qs'					# List user installed packages
alias pacs='pacman -Ss'					# Search repositories for package
alias paci='pacman -S'					# Install package
alias pacr='pacman -Rs'					# Remove package
alias pacc='pacman -Qdtq | pacman -Rs'	# Cleanup packages

# Application launchers
#------------------------------------------------
alias cal='qalc'			# Calculator
alias play='mpv'			# Media player
alias sys='btm'				# System monitor
alias disk='dust'			# Disk manager
alias file='lf'				# File manager
alias br='vimv'				# Bulk rename
#alias music='ncmpcpp'		# Music player
#alias mail='neomutt'		# Email
#alias rss='newsboat'		# RSS reader

# Files
#------------------------------------------------
alias play='mpv'			# Video/audio player
alias pdf='zathura'			# PDF viewer
alias icat='kitty +kitten icat'	# Image cat

# Change default ls behavior
#------------------------------------------------
alias ls='ls -lh --color=auto'
alias ll='ls -lah --color=auto'

# Confirm before overwriting something
#------------------------------------------------
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Bookmarks for common files/directories
#------------------------------------------------
alias cdcf='cd $HOME/config-repo/ && ll'
alias cdpic='cd $HOME/Pictures/ && ll'
alias cdtex='cd $HOME/Documents/tex/ && ll'
alias cdwiki='cd $HOME/Wiki/ && ll'

# Edit config files
#------------------------------------------------
alias evim='vim $HOME/config-repo/vim/.vimrc'
alias ebash='vim $HOME/config-repo/bash/.bashrc'
alias ewm='vim $HOME/config-repo/i3/config'
alias eterm='vim $HOME/config-repo/kitty/kitty.conf'
alias ecd='vim $HOME/config-repo/abcde/abcde.conf'

# Fetch
#------------------------------------------------
alias neofetch='clear && neofetch'

# Shutdown
#------------------------------------------------
alias restart='shutdown -r now'

# Grep
#------------------------------------------------
alias grep='grep --color=auto'
alias fontgrep='fc-list | grep -i --color=auto'

# Rip disks to file
#------------------------------------------------
# Rip audio CD to flac
alias ripcd='abcde -o flac -G -c ~/.config/abcde/abcde.conf'
# Rip audiobook CD to voice optimized, low bitrate opus
alias ripbook='abcde -o opus -c $HOME/.config/abcde/abcdebook.conf'
# Rip DVD
#makeMKV plus handbrake. 
#https://github.com/automatic-ripping-machine/automatic-ripping-machine

# yt download
#------------------------------------------------
#List available codecs
alias ytls='yt-dlp -F'
# Extract audio, opus best quality
alias yta='yt-dlp -x --audio-format opus --audio-quality 0 --embed-thumbnail -P $HOME/Music/unsorted'
# Look into possible codecs. One for small and efficient, one for best. 
# Downsample highest resolution to 1080p. 
# Look at '--remux-video' '--sponsorblock-remove'
# Use AV1 if available.
#alias ytv-best='yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 '

# Git
#------------------------------------------------
alias gs='git status -sb'							# Git status
alias gu='git pull'									# Git pull (update)
alias ga='git add'									# Git add
alias gg='!git rev-list --all | xargs git grep -F'	# Search commits (grep)
alias gl='git log --oneline'						# Git log
alias gd='git diff origin/main'						# Diff staged changes
alias gvd='git difftool -t vimdiff -y'				# Git vimdiff
alias gc='git commit'								# Commit message in editor
alias gp='git push -u origin main'					# Git push to origin
