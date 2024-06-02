# Settings ====================================================================
export EDITOR=nvim
bindkey -e
source $HOME/.aliases

zstyle ':completion:*' completer _expand_alias _complete _ignored

# ZSH HOME ====================================================================
export ZSH="$HOME/.zsh"

# PATH ========================================================================
export PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin"
export PATH="$PATH:$HOME/.local/bin"


### HISTORY CONFIG =============================================================
export HISTFILE="$ZSH/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

# PLUGINS =====================================================================
source "$ZSH/plugins/spaceship-prompt/spaceship.zsh"

# SPACESHIP ===================================================================
SPACESHIP_PROMPT_ORDER=(
	user 
	dir 
	time 
	git 
	venv
	exec_time 
	exit_code 
	line_sep
	char
)

# ZOXIDE ======================================================================
eval "$(zoxide init --cmd cd zsh)"

# DIRENV =====================================================================
eval "$(direnv hook zsh)"

# FZF =========================================================================
source "$HOME/.local/bin/deps/fzf/shell/completion.zsh"
source "$HOME/.local/bin/deps/fzf/shell/key-bindings.zsh"


# ZSH-PLUGINS =================================================================
autoload -U compinit; compinit
source "$ZSH/plugins/fzf-tab/fzf-tab.plugin.zsh"

