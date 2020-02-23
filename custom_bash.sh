# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jasmin.virdi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="Avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "Avit")

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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
 git
 zsh-syntax-highlighting
 zsh-autosuggestions)

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

# Show Library folder
chflags nohidden ~/Library

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES


# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Prevent left and right swipe through history in Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias s=git_status

function git_status() {
        if git ls-files >& /dev/null; then
              git branch -avv;
              echo "";
              git status -s
        else
             echo 'This is not a git directory'
        fi
}
export PATH="$PATH:/usr/local/share/npm/bin"


export NVM_DIR="/Users/jasmin.virdi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#test prompt command function
PROMPT_COMMAND=prompt_func
 
function prompt_func() {
  # Initialize the prompt
  PS1=""
 
  # Add a newline
  PS1="\n"
 
  # Status of last command
  PS1+='`if [ $? = 0 ]; then echo "\[\033[01;32m\]•"; else echo "\[\033[01;31m\]•"; fi` '
 
  # Command history number
  PS1+="$ICyan\!$Color_Off "
 
  # User and hostname
  PS1+="$IYellow\u@\h$Color_Off "
 
  # Current time
  PS1+="`date +%H:%M:%S` "
 
  # Working branch (If folder is a GIT folder)
  PS1+="$ICyan`__git_ps1`$Color_Off "
 
  # Working directory
  PS1+="$IGreen\w$Color_Off "
 
  # macOS only - Add the current Spotify track and artist
  if [[ "$OSTYPE" == "darwin"* ]]; then
    PS1+=" "
    PS1+="$IPurple"
 
    PS1+=`osascript -e  'if application "Spotify" is running then
      tell application "Spotify" to name of current track as string
    end if'`;
 
    PS1+=" - "
 
    PS1+=`osascript -e  'if application "Spotify" is running then
      tell application "Spotify" to artist of current track as string
    end if'`;
  fi
 
  PS1+="$Color_Off"
 
  # Add a newline
  PS1+="\n"
 
  # Add a trailing dollar sign
  PS1+="\$ "
}

REMOTE=`git config --get remote.origin.url`
USERNAME=`git config --get user.name`
EMAIL=`git config --get user.email`


alias checkGit=checkEmailUsername
#setting git config depending on the remote origin
function checkEmailUsername() {
	if [[ -z "$EMAIL" ]]; then
		echo "No email found";
	else 
		if [[ "$EMAIL" != "$1" ]]; then
		  echo "Invalid email: $EMAIL";
		  echo "git config user.email $1";
		  #exit 1;
		fi
		echo "$EMAIL --> $1";
	fi

	if [[ -z "$USERNAME" ]]; then
		echo "No userName found";
	else 
		if [[ "$USERNAME" != "$1" ]]; then
		  echocat /etc/passwd "Invalid username: $USERNAME";
		  echo "git config user.name $2";
		  #exit 1;
		fi
		echo "$USERNAME --> $2";
	fi
}

if [[ $REMOTE == *"git.corporateRepo.com"* ]]           # add work email here
then
  echo "print 1";
  checkEmailUsername myCorporate@email.com corporateUsername
fi

if [[ $REMOTE == *"github.com/buckleader"* ]]
then
  echo "print here";
  checkEmailUsername jasmin28virdi@gmail.com "buckleader"
fi

#change username function
#PROMPT="$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"
PROMPT='$fg[cyan]%}$USER@%{$fg_bold[red]%} ➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

alias disk_info=fetchDiskData
#check disk information
function fetchDiskData() {
 df -i
 df -h
 df -k
}

alias ipv4=checkIPv4
# check network IPv4
function checkIPv4() {
 if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "IPv4 is up"
 else
  echo "IPv4 is down"
 fi
}

alias ipDNS=checkIPDNS
#check IP and DNS
function checkIPDNS(){
 if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "The network is up"
 else
  echo "The network is down"
 fi
}

# some real time issues.
alais list=ls |less

function sortReverse() {
 cat $1 | sort -r | lpr
}








