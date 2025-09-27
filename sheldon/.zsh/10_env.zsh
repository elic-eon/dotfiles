export EDITOR=vim

# set cache env for OMZ completion plugins
export ZSH_CACHE_DIR="$HOME/.cache/zsh"

# include completion functions
export FPATH="$ZSH_CACHE_DIR/completions:$FPATH"

# set history
export HISTFILE="$HOME/.history"
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE