# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

PATH="/usr/local/bin:$PATH"
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose aws)

# BREW autocompletion, must be before source oh-my-zsh
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#-------------------------
# iTerm
#-------------------------
bindkey "[D" backward-word   # ⌥ + ←/→   move one word backward/forward
bindkey "[C" forward-word
# fn + ←/→   move to beginning/end of line


# JAVA HOME IS SET BY THIS EXECUTABLE
# export JAVA_HOME="$(/usr/libexec/java_home -v 14.0)"
# export JAVA_HOME="$(/usr/libexec/java_home)"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
alias zrc="vim -c 'exe \"norm G\"' ~/.zshrc" # edit zshrc, place cursor to end of file
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias rrf="rm -rf"
alias execute-right="chmod +ux"
alias rel="source ~/.zshrc"

#-------------------------
# Navigation
#-------------------------
PROJECTS_PATH=~/projects

alias p="cd $PROJECTS_PATH"

# LS
alias ls='ls --color=auto --group-directories-first --sort=time'
alias la='ls -la --color=auto --group-directories-first --sort=time'

#---------------------------
# Git
#---------------------------
alias gm="git commit -m"
alias gl="git log"
alias gdc="git diff --cached"
alias gs="git status"
alias gsu="git status -uno"
alias gfp="git fetch -p"
alias please-make-git-status-faster-for-this-repo="git config core.untrackedCache true && git config core.fsmonitor true"

## dangerous: 
#alias git-delete-branch-everywhere="git push origin --delete $(git branch --show-current) && git switch - && git branch -D $(git branch --show-current)"

# remove branches that have been merged, edit list of branches to be deleted (here in VIM) before deletion
alias gdel="git branch --merged >/tmp/merged-branches && vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"

# Switch local git user (for current repo)
# [SHOULD NOT BE NEEDED]
# --- use Conditional Includes instead (https://git-scm.com/docs/git-config#_conditional_includes)
alias ghajame="git config --local user.email 'hajame@posteo.fi' && git config --local user.name 'hajame'"
alias ghajaknow="git config --local user.email 'Harri.Mehtaelae@knowit.fi' && git config --local user.name 'Harri Mehtälä'"

#---------------------------
# Docker / Kubernetes
#---------------------------
alias dps="docker ps"
alias dcu="docker-compose up -d"
alias dim="docker images -a"
alias docker-prune="docker system prune"			# Remove all unused containers, networks, images (both dangling and unreferenced)
alias docker-prune-all="docker system prune -af"      	# removes all unused images, not just dangling ones
alias docker-remove-dangling='docker rmi $(docker images --filter "dangling=true" --format "{{.ID}}")'
alias docker-remove-exited="docker ps -a | awk '/Exited/ {print $1}' | xargs docker rm"

#docker start
#docker stop

alias pods="kubectl get pods -A"


#---------------------------
# Misc
#---------------------------

# VIM
alias vrc="vim ~/.vimrc"
alias sshconfig="vim ~/.ssh/config"

# Create IBAN, BRN, HETU
alias iban="curl -s https://www.telepartikkeli.net/tunnusgeneraattori/Home/GenerateIban -d \"IbanAmount=1&GroupIbanNumber=true&GroupIbanNumber=false&WeightLargeBanks=false\" | cut -d'<' -f 1 | tr -d '\n' | pbcopy"
alias brn="curl -s https://www.telepartikkeli.net/tunnusgeneraattori/Home/GenerateCompanyId -d \"CidAmount=1\" | cut -d'<' -f 1 | pbcopy"
alias hetu="curl -s https://www.telepartikkeli.net/tunnusgeneraattori/Home/GenerateID -d \"YearOfBirth=&YearOfBirthStart=&YearOfBirthEnd=&Men=true&Men=false&Women=true&Women=false&OnlyTempHetus=false&Law2023=false&PidAmount=1\" | cut -d'<' -f 1 | pbcopy"

#-------------------------------------------------
# Maven
#-------------------------------------------------
# alias blvt="mvn clean install -U -T 1C -PFoo,Bar,asd -DskipTests -Djacoco.skip=true -DtargetEnv=foo_bar"

#-------------------------------------------------
# Amazon Web Services
#-------------------------------------------------

alias list-s3="aws s3 ls --profile PROFILE_NAME"
alias aws-login="aws sso login --profile PROFILE_NAME"

# SWITCHING AWS PROFILES:
# asp PROFILE_NAME login


# "LEAVE AT THE END" ------------------------------------------

# Node version manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The "z" program, I guess this must be the last one?
. /usr/local/etc/profile.d/z.sh
