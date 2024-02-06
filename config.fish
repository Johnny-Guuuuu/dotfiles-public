if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting "Enjoy coding. Have a beautiful day!" \U1F609 \U1F601

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx EDITOR nvim

# aliases
# alias ra ranger
# alias ga "git add ."
# alias gc "git cz"
# alias gl "git pull --rabase"
# alias gp "git push"
# alias gs "git status"
# alias gb "git branch"

# abbreviations
abbr --add ra ranger
abbr --add nv nvim
abbr --add ga git add .
abbr --add gc git cz
abbr --add gl git pull --rebase
abbr --add gp git push
abbr --add gs git status
abbr --add gb git branch
abbr --add gd git diff
abbr --add gco git checkout
abbr --add glast git log -1 HEAD
abbr --add gcane git commit --amend --no-edit
abbr --add glo git log --oneline -n 10
abbr --add ows open_work_space .
abbr --add gf git_fast_add_and_commit

command -qv nvim && alias vim nvim

# remove safely
function rms
    mv $argv ~/.RecycleBin/
end

# clean RecycleBin
function clean_recycle_bin
    rm -rf ~/.RecycleBin/*
end

#!/usr/bin/env fish
function ranger
    command ranger --choosedir=$HOME/.rangerdir
    set LASTDIR (cat $HOME/.rangerdir)
    cd "$LASTDIR" $argv
end


function nvm
    bass source ~/.nvm/nvm.sh ';' nvm $argv
end

function open_work_space
    open -a Simulator
    open -a Safari
    cd $argv
    code .
end

function git_fast_add_and_commit
    git add .
    # 没有参数传入
    if test (count $argv) -eq 0
        git commit -m "fix: 更新"
    else
        git commit -m "fix: $argv[1]"
    end
end

# 应对第一次使用git cz时,找不到git cz的情况
function gcc
    npm list -g | grep cz
    git cz
end

function switch_jdk
    echo "17.0.19, 21.0.1 is switchable"
    switch $argv[1]
        case 17
            set -gx JAVA_HOME /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home/
            set -gx PATH $JAVA_HOME $PATH
            echo '17.0.19 is successfully switched!'
        case 21
            set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/
            set -gx PATH $JAVA_HOME $PATH
            echo '21.0.1 is successfully switched!'
        case '*'
            echo invalid version $argv[1]
    end
end

function proxy_on
    set -Ux https_proxy http://127.0.0.1:7890
    set -Ux http_proxy http://127.0.0.1:7890
    set -Ux all_proxy socks5://127.0.0.1:7890
    echo "Network Proxy on"
    echo all_proxy=$all_proxy
    echo htttp_proxy=$http_proxy
    echo https_proxy=$https_proxy
end

function proxy_off
    set -e https_proxy
    set -e http_proxy
    set -e all_proxy
    echo "Network Proxy off"
end

function mirror_on
    npm config set registry https://registry.npmmirror.com
    yarn config set registry "https://registry.npmmirror.com"
    show_registry
end

function sankuai_on
    npm config set registry http://r.npm.sankuai.com/
    yarn conifg set registry "http://r.npm.sankuai.com"
    show_registry
end

function rm_registry
    npm config rm registry
    yarn config delete registry
    show_registry
end

function show_registry
    echo "======================"
    echo "npm registry:"
    npm config get registry
    echo "yarn registry:"
    yarn config list | grep registry
end


# tide_config
set -g tide_git_bg_color 268bd2
set -g tide_git_bg_color_unstable C4A000
set -g tide_git_bg_color_urgent CC0000
set -g tide_git_branch_color 000000
set -g tide_git_color_branch 000000
set -g tide_git_color_conflicted 000000
set -g tide_git_color_dirty 000000
set -g tide_git_color_operation 000000
set -g tide_git_color_staged 000000
set -g tide_git_color_stash 000000
set -g tide_git_color_untracked 000000
set -g tide_git_color_upstream 000000
set -g tide_git_conflicted_color 000000
set -g tide_git_dirty_color 000000
set -g tide_git_icon 
set -g tide_git_operation_color 000000
set -g tide_git_staged_color 000000
set -g tide_git_stash_color 000000
set -g tide_git_untracked_color 000000
set -g tide_git_upstream_color 000000
set -g tide_pwd_bg_color 444444
