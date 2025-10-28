# nvm 
# zstyle ':omz:plugins:nvm' lazy yes
# zstyle ':omz:plugins:nvm' lazy-cmd nvm node rush rushx git

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

# Function to update theme based on system appearance
update_theme() {
  if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
    export THEME_MODE="dark"
    source "$ZSH_CUSTOM/patches/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh"
  else
    export THEME_MODE="light"
    source "$ZSH_CUSTOM/patches/zsh-syntax-highlighting/themes/catppuccin_latte-zsh-syntax-highlighting.zsh"
  fi

  source "$HOME/.config/lazygit/env"
}

# Initial theme setup
update_theme

# Set up trap to update theme when terminal receives SIGUSR1
trap update_theme SIGUSR1

# You can trigger theme update by running: kill -SIGUSR1 $$
# To automate this when system theme changes, you'll need to set up a separate
# script or service that detects theme changes and sends SIGUSR1 to terminal processes

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(
  git
  nvm
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# JAVA_OPTS="$JAVA_OPTS -DsocksProxyPort"

# eval "$(/opt/homebrew/bin/brew shellenv)"

# lazygit
alias lg="lazygit"

# java
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

# alias
alias n="nvim"
alias f="fzf"
alias rm="trash"

# anaconda
conda() {
  # Unset this function to avoid recursion
  unfunction conda

  # Run the original conda setup
  __conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/opt/homebrew/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  
  # Now execute the original command
  conda "$@"
}


# --- BEGIN FEDERATED REPO GIT TELEMETRY CODE BLOCK ---
# https://bytedance.sg.larkoffice.com/docx/SurId67UBoZxHwxe07Clr5Ufgog

export FEDERATED_REPO_GIT_TELEMETRY_VERSION=1.2.0
export GIT_TRACE2_EVENT="$HOME/.trace2/event"
export GIT_TRACE2_EVENT_BRIEF=true
export GIT_TRACE2_MAX_FILES=100000

# --- END FEDERATED REPO GIT TELEMETRY CODE BLOCK ---

export PATH="$PATH:$(brew --prefix rustup)/bin"
