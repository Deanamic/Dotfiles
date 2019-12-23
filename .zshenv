if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# Set our default path
TMPPATH="/usr/local/sbin:/usr/bin/core_perl:/usr/local/bin:/usr/bin:$HOME/.config/bspwm/panel:$HOME/.bin"
NPMPATH=/home/dean/npm-packages/bin
CUSTOMPATH=/home/dean/bin
export GOPATH=/home/dean/go
TMPPATH=$CUSTOMPATH:$NPMPATH:$GOPATH/bin:/usr/local/bin:/home/dean/.local/bin:$TMPPATH
export PANEL_FIFO="/tmp/panel-fifo"
export XDG_CONFIG_HOME="$HOME/.config"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export PANEL_HEIGHT=25
export GUI_EDITOR=/usr/bin/micro-st
export BROWSER=/usr/bin/firefox
export TERMINAL=/usr/bin/kitty
export QT_QPA_PLATFORMTHEME="qt5ct"
export VISUAL=/usr/bin/micro
export EDITOR=/usr/bin/emacs
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PANEL_FIFO="/tmp/panel-fifo"
export XDG_CONFIG_DIRS=/usr/etc/xdg:/etc/xdg
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY

export PS_FORMAT="pid,ppid,user,pri,ni,vsz,rss,pcpu,pmam,tty,stat,args"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-j:preview-down,ctrl-k:preview-up'"

FD_OPTIONS="--follow --exclude .git --exclude node_modules -H"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard || fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

export BAT_PAGER="less -R"

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dean/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dean/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dean/anaconda3/etc/profile.d/conda.sh"
    else
        export TMPPATH="/home/dean/anaconda3/bin:$TMPPATH"
    fi
fi
unset __conda_setup

export PATH=$TMPPATH:$PATH
