# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [ -z "$SSH_CONNECTION" ]; then
    # Local User
    DEFAULT_USER=$(whoami)
fi
ZSH_THEME="norm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow osx pip sudo virtualenvwrapper common-aliases)

source $ZSH/oh-my-zsh.sh

# User configuration
ANDROID_SDK_PATH="$HOME/android-sdk/macosx"
ANDROID_PATHS="$ANDROID_SDK_PATH/platform-tools:$ANDROID_SDK_PATH/tools"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:$HOME/bin:$ANDROID_PATHS:$HOME/.cargo/bin:$HOME/Library/Python/2.7/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/code/go"
export GOPATH="/Users/rhay/code/firmata-arduino/test/neopixel_test/go/"

export P4CONFIG=.p4config

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi=`which vim`
epsync() { aws s3 sync --acl public-read $@ $HOME/poorimpulse_audio s3://episodes.poorimpulse.co }
function pie() {
  mp3info -p "%f %m:%s " $1
  ls -l $1 | cut -d\  -f8
}
alias lss='ls -lSrh'

function mdhdr () { grep -e '^#' $1 }
function mdcnthdr () { mdhdr $1 | sort | uniq -c }
function wcc () {
  mkdir -p /tmp/chp 2> /dev/null
  FILE=$(pwd)/$1
  (cd /tmp/chp && csplit -k $FILE '/^#/' {99}) 2> /dev/null
  for n in $(ls /tmp/chp)
  do
    CHAPTER=$(grep -e '^#' /tmp/chp/$n)
    LINE_COUNT=$(wc -w /tmp/chp/$n | cut -d/ -f1)
    echo $CHAPTER $LINE_COUNT
  done
  rm -rf /tmp/chp
}

function vict() {
  vi $1 && cargo 'test'
}

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

export RUST_SRC_PATH=$HOME/.rustc/rustc/src

if [ $(uname) = "Darwin" ]; then
  source $HOME/.iterm2_shell_integration.zsh
fi

# added by travis gem
[ -f /home/rhay/.travis/travis.sh ] && source /home/rhay/.travis/travis.sh
