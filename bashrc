#!/bin/bash
# File              : bashrc
# Author            : Xianglan Piao <xianglan0502@gmail.com>
# Date              : 2018.08.12
# Last Modified Date: 2018.08.12
# Last Modified By  : Xianglan Piao <xianglan0502@gmail.com>
# File: .bashrc
# Author: Xianglan Piao <xianglan0502@gmail.com>
# Date: 2012.07.31

################################################################################
## Temporary Command Configurations
################################################################################

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export CC='/usr/bin/clang-4.0'
    export CXX='/usr/bin/clang++-4.0'

    ## trunk dir
    export TRUNK=$HOME/trunk

    ## d3d11 dir
    alias toc='cd $TRUNK/src/toc'
    alias build='cd $TRUNK/src/toc/build'
    alias test='cd $TRUNK/src/toc/test/gk/gk1-4'
    alias lib='cd $TRUNK/src/toc/src/lib/twk2/directx'
    alias dll='cd $TRUNK/src/toc/src/dlls'
    alias spirv='cd $TRUNK/src/toc/src/lib/twk2/directx/external/spirv'
    alias mesa='cd $TRUNK/third_party/mesa-17.2.2'
    alias egl='cd $TRUNK/src/lib/graphics_infra/egl'
    alias wsi='cd $TRUNK/src/lib/graphics_infra/wsi'
    alias cwm='cd $TRUNK/src/core/cwm'
    alias ddraw='cd $TRUNK/src/toc/src/lib/tgk2/ddraw'
    alias twk2='cd $TRUNK/src/toc/src/lib/twk2'
    alias tgk='cd $TRUNK/src/lib/tgk'
    alias tgk2='cd $TRUNK/src/toc/src/lib/tgk2'
    alias gdi='cd $TRUNK/src/toc/src/lib/new_tgk2/gdi'
    alias gdip='cd $TRUNK/src/toc/src/lib/new_tgk2/gdiplus'
    alias wine='cd ~/sy/git/2D/wine'
    alias skia='cd ~/sy/git/2D/skia'
    alias t2d='cd ~/sy/git/2D/t2d'
    alias log='cd /zone/normal/rootfs/home/tt'
    alias dx='cd $TRUNK/src/toc/src/lib/twk2/directx'
    alias dxvk='cd ~/sy/git/3D/dxvk'
    alias vk9='cd ~/sy/git/3D/VK9'

    ## spirv dir
    export SPIRV=$TRUNK/src/toc/src/lib/twk2/directx/external/spirv

    alias glslangValidator=$SPIRV/glslangValidator
    alias spirv-dis=$SPIRV/spirv-dis
    alias spirv-cross=$SPIRV/spirv-cross

    # export GLSLANG=$SPIRV/glslang
    # alias glslangValidator=$GLSLANG/build/install/bin/glslangValidator
    # alias spirv-remap=$GLSLANG/build/install/bin/spirv-remap

    # export SPIRV_Tools=$SPIRV/SPIRV-Tools
    # alias spirv-as=$SPIRV_Tools/build/install/bin/spirv-as
    # alias spirv-dis=$SPIRV_Tools/build/install/bin/spirv-dis
    # alias spirv-cfg=$SPIRV_Tools/build/install/bin/spirv-cfg
    # alias spirv-opt=$SPIRV_Tools/build/install/bin/spirv-opt
    # alias spirv-val=$SPIRV_Tools/build/install/bin/spirv-val

    # export SPIRV_Cross=$SPIRV/SPIRV-Cross
    # alias spirv-cross=$SPIRV_Cross/build/install/bin/spirv-cross
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export GIT=$HOME/git
    alias gl='cd $GIT/private/opengl_example'
    alias gof='cd $GIT/private/gof'
    
    alias ogl='cd $GIT/graphics/3D/ogl'
    alias sb='cd $GIT/graphics/3D/sb7code'
    alias lgl='cd $GIT/graphics/3D/LearnOpenGL'
    alias wine='cd $GIT/graphics/wine'
    
    ## SSH Settings
    alias sy='ssh root@192.168.10.110'
fi

################################################################################
## User Command Configurations
################################################################################
## Used in server pc
alias tmux_new='tmux new -s test'
alias tmux_attach='tmux a -t test'
alias tmux_kill='tmux kill-session -t test'
## Used in client pc
alias tmux_server='ssh root -t "tmux -u -CC attach"'

export HL=$HOME/workspace/
# export CUDAROOT=/usr/local/cuda-5.0
# export LD_LIBRARY_PATH=$CUDAROOT/lib64:$LD_LIBRARY_PATH
# export PYTHONPATH=$PYTHONPATH:~/workspace/scripts
# export PIN_ROOT=~/svn/papl/external/pin-2.13-65163-gcc.4.4.7-linux


################################################################################
## System Command Configurations
################################################################################
export PATH=/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
export EDITOR=vim
export SVN_EDITOR=vim
export SVN_MERGE=vimdiff
export FIGNORE=.svn
export TERM=xterm-256color
export DISPLAY=:0
export GNUTERM=x11

export LSCOLORS="ExGxBxDxCxEgEdxbxgacad"
export GREP_COLORS="ms=01;32:mc=01;32:sl=:cx=01;30:fn=35:ln=32:bn=32:se=36"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls --color=auto'
    alias grep="grep --exclude-dir='.svn' --exclude=tags --color=auto"
elif [[ "$OSTYPE" == "darwin17" ]]; then
# else # OS X
    export CLICOLOR=1
    export LC_ALL='en_US.UTF-8'
    alias grep="grep --exclude-dir='.svn' --exclude=tags --color=auto"
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH" ## For MacPorts
    # alias ctags="`brew --prefix`/bin/ctags"
else
    alias grep="grep --exclude-dir='.svn' --exclude=tags --color=auto"
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias checkport="sudo lsof -i -P | grep -i 'listen'"


################################################################################
## Functions
################################################################################
function gitclean()
{
    echo "recursively removing all .git folders from the following directory"
    pwd
    find . -name .git -print0 | xargs -0 rm -rf
}

function svnclean()
{
    echo "recursively removing all .svn folders from the following directory"
    pwd
    find . -name .svn -print0 | xargs -0 rm -rf
}

function x11()
{
    if [[ "$1" == "reset" ]]; then
        export DISPLAY=:0
        echo $DISPLAY
    elif [[ "$1" == "set" ]]; then
        export DISPLAY=localhost:10.0
        echo $DISPLAY
    fi
}

function monitor()
{
    if [[ "$1" == "on" ]]; then
        xset dpms force on
        xset dpms s reset
        echo "Turn on monitor..."
    elif [[ "$1" == "off" ]]; then
        xset dpms force off
        echo "Turn off monitor..."
    fi
}

function countType()
{
    find . -type f | sed -e 's/.*\.//' | sed -e 's/.*\///' | sort | uniq -c | sort -rn
}

function psColor()
{
    local BLACK="\[\033[0;30m\]"
    local BLACKBOLD="\[\033[1;30m\]"
    local RED="\[\033[0;31m\]"
    local REDBOLD="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local GREENBOLD="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local YELLOWBOLD="\[\033[1;33m\]"
    local BLUE="\[\033[0;34m\]"
    local BLUEBOLD="\[\033[1;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local PURPLEBOLD="\[\033[1;35m\]"
    local CYAN="\[\033[0;36m\]"
    local CYANBOLD="\[\033[1;36m\]"
    local WHITE="\[\033[0;37m\]"
    local WHITEBOLD="\[\033[1;37m\]"

    OS=$(uname -s)

    export PS1="\[\e]0; \u@\h: \w\a\]$REDBOLD\u$CYANBOLD@\h:$WHITEBOLD\w\[\e[00m\] "
}
psColor

function notify()
{
    me="HL"
    echo "[$me-alert] $@"
}

function sshhl()
{
    papl
    # ssh ubuntu and change dir to $sshpath
    sshpath=$(pwd | cut -d/ -f5-)           # cut /Users/hyanglan/ubuntu/
    sshpath="/home/hyanglan/"$sshpath       # insert /home/hyanglan/ at front
    echo connect to ubuntu:$sshpath         # print
    ssh ubuntu -t "cd $sshpath; /bin/bash"  # connect ssh and cd
}

function papl()
{
    if [[ "$1" == "kill" ]]; then
        echo "umount ubuntu"
        umount -f ~/ubuntu
        echo "killall ssh"
        killall ssh
    else
        if [[ "$1" == "mount" ]]; then
            echo "mount ubuntu:/home/hyanglan/ to ~/ubuntu"
            sshfs ubuntu:/home/hyanglan/ ~/ubuntu/ -o auto_cache,reconnect,workaround=rename,transform_symlinks,noappledouble
        else
            echo "open port 2222 (ubuntu) and 4444 (server)"
            ssh -fN papl

        fi
    fi
}

function extract()
{
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)  tar xjf $1     ;;
            *.tar.gz)   tar xzf $1     ;;
            *.tar.xz)   tar xf $1      ;;
            *.bz2)      bunzip2 $1     ;;
            *.rar)      unrar e $1     ;;
            *.gz)       gunzip $1      ;;
            *.tar)      tar xf $1      ;;
            *.tbz2)     tar xjf $1     ;;
            *.tgz)      tar xzf $1     ;;
            *.zip)      unzip $1       ;;
            *.Z)        uncompress $1  ;;
            *.7z)       7z x $1        ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a vaild file"
    fi
}
export CC='/usr/bin/clang'
export CXX='/usr/bin/clang++'
