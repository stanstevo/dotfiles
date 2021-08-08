# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

export ZSH="$HOME/.oh-my-zsh"

plugins=(
    zsh-nvm
    git
    battery
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    fzf-tab
    zsh-history-substring-search
    zsh-better-npm-completion
)

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'
export TERM='xterm-256color'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
alias vimf="vim \$(fzf)"
alias w10="sudo mount.ntfs /dev/sda4 /windows10"
alias zconf="vim ~/.zshrc"
alias vconf="vim ~/.vimrc"
alias bar="vim ~/.config/polybar/config.ini"
alias i3conf="vim ~/.config/i3/config"
alias kittyconf="vim ~/.config/kitty/kitty.conf"
alias lightdmconf="sudo nvim /etc/lightdm/lightdm-webkit2-greeter.conf"
alias lightdmwebkitconf="sudo nvim /usr/share/lightdm-webkit/themes"
alias play="mocp"
alias yt="youtube-dl -f 'best[height<=720]+bestaudio' --embed-thumbnail --add-metadata"
alias stata="wine64 /home/stanoo/Downloads/Stata-MP-16.0/StataMP-64.exe & disown"
alias ytm='youtube-dl --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3'
alias rm='rm -i'
alias dots='/usr/bin/git --git-dir=/home/stanoo/.dots/ --work-tree=/home/stanoo'
alias ls="ls --color"
(cat $HOME/.config/wpg/sequences &)

source ~/.cache/wal/colors-tty.sh

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

function m() {
python3 -c print("$1")
}

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

#Set your environment path
export PATH=/home/stanoo/.local/bin:/usr/local/bin:/usr/local/stata14:/usr/bin:/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/stanoo/flutter/bin:/home/stanoo/.cargo/bin:home/.cargo/env:/var/lib/snapd/snap/bin:/usr/local/sbin:/home/stanoo/bin:/home/stanoo/.local/share/gem/ruby/3.0.0/bin

#Tex live
#PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH; export PATH
#MANPATH=/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH; export MANPATH
#INFOPATH=/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH; export INFOPATH

#$HOME/bin
#PATH=/home/stanoo/.TinyTex/bin/x86_64-linux:$PATH; export PATH

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
#export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
