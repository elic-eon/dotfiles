zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# libs
zplug "lib/completion", from:oh-my-zsh, defer:0
zplug "lib/directories", from:oh-my-zsh, defer:0
zplug "lib/grep", from:oh-my-zsh, defer:0
zplug "lib/key-bindings", from:oh-my-zsh, defer:0
zplug "lib/history", from:oh-my-zsh, defer:0
zplug "lib/misc", from:oh-my-zsh, defer:0
zplug "lib/termsupport", from:oh-my-zsh, defer:0

# Add zplug plugins
#zplug "elic-eon/lambda-mod-zsh-theme", as:theme
zplug "~/.zsh", from:local, use:"<->_*.zsh"
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "rupa/z", use:"z.sh"
#zplug "mafredri/zsh-async"
#zplug "sindresorhus/pure", use:"pure.zsh", as:theme
zplug "fcambus/ansiweather"
zplug "romkatv/zsh-prompt-benchmark"
zplug "ael-code/zsh-colored-man-pages"
zplug "fabiokiatkowski/exercism.plugin.zsh"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", frozen:1
zplug "starship/starship", as:command, from:gh-r, rename-to:"starship"
zplug "stedolan/jq", from:gh-r, as:command, rename-to:"jq"
zplug "mikefarah/yq", from:gh-r, as:command, rename-to:"yq"
zplug "sharkdp/bat", from:gh-r, as:command, rename-to:"bat"
zplug "dandavison/delta", from:gh-r, as:command, rename-to:"delta"
zplug "Peltoche/lsd", from:gh-r, as:command, rename-to:"lsd"
zplug "BurntSushi/ripgrep", from:gh-r, as:command, rename-to:"rg"
zplug "sharkdp/fd", from:gh-r, as:command, rename-to:"fd"

zplug "zdharma-continuum/fast-syntax-highlighting", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-autosuggestions", defer:3
