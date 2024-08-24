__zplug::utils::releases::get_latest()
{
    local repo="$1"
    local cmd url

    url="https://github.com/$repo/releases/latest"

    if (( $+commands[curl] )); then
        cmd="command curl -fsSL -o /dev/null -w %{url_effective}"
        eval "$cmd $url" \
            2>/dev/null \
            | awk -F/ '{print $NF}'
    elif (( $+commands[wget] )); then
        cmd="command wget -qO /dev/null -S"
        eval "$cmd $url" \
            2>&1 \
            | awk '/^  Location: /{print $2}' \
            | awk -F/ '{print $NF}'
    fi
}

__zplug::utils::releases::get_state()
{
    local state name="$1" dir="$2"

    if [[ "$(__zplug::utils::releases::get_latest "$name")" == "$(command cat "$dir/INDEX" 2>/dev/null)" ]]; then
        state="up to date"
    else
        state="local out of date"
    fi

    case "$state" in
        "up to date")
            return $_zplug_status[up_to_date]
            ;;
        "local out of date")
            return $_zplug_status[out_of_date]
            ;;
        *)
            return $_zplug_status[unknown]
            ;;
    esac
}

__zplug::utils::releases::get_url()
{
    local    repo="$1" result
    local -A tags
    local    cmd url
    local    arch
    local -a candidates

    {
        tags[use]="$(
        __zplug::core::core::run_interfaces \
            'use' \
            "$repo"
        )"
        tags[at]="$(
        __zplug::core::core::run_interfaces \
            'at' \
            "$repo"
        )"
        if [[ $tags[at] == "latest" ]]; then
            tags[at]="$(__zplug::utils::releases::get_latest $repo)"
        fi
    }

    # Get machine information
    if __zplug::utils::releases::is_64; then
        arch="64"
    elif __zplug::utils::releases::is_arm; then
        arch="arm"
    else
        arch="386"
    fi

    url="https://github.com/$repo/releases/expanded_assets/$tags[at]"
    if (( $+commands[curl] )); then
        cmd="command curl -fsSL"
    elif (( $+commands[wget] )); then
        cmd="command wget -qO -"
    fi

    candidates=(
    ${(@f)"$(
    eval "$cmd $url" \
        2>/dev/null \
        | grep -o '/'"$repo"'/releases/download/[^"]*'
    )"}
    )

    if (( $#candidates == 0 )); then
        __zplug::io::print::f \
            --die \
            --zplug \
            "$repo: there are no available releases\n"
        return 1
    fi

    candidates=( $( echo "${(F)candidates[@]}" | grep -E "${tags[use]:-}" ) )
    if (( $#candidates > 1 )); then
        candidates=( $( echo "${(F)candidates[@]}" | grep "$arch" ) )
    fi
    result="${candidates[1]}"

    if [[ -z $result ]]; then
        __zplug::io::print::f \
            --die \
            --zplug \
            "$repo: repository not found\n"
        return 1
    fi

    echo "https://github.com$result"
}

zplug "junegunn/fzf", as:command, from:gh-r, rename-to:"fzf", frozen:1
zplug "jqlang/jq", from:gh-r, as:command, rename-to:"jq"
zplug "mikefarah/yq", from:gh-r, as:command, rename-to:"yq"
zplug "sharkdp/bat", from:gh-r, as:command, rename-to:"bat"
zplug "dandavison/delta", from:gh-r, as:command, rename-to:"delta"
zplug "lsd-rs/lsd", from:gh-r, as:command, rename-to:"lsd"
zplug "BurntSushi/ripgrep", from:gh-r, as:command, rename-to:"rg"
zplug "sharkdp/fd", from:gh-r, as:command, rename-to:"fd"
zplug "starship/starship", as:command, from:gh-r, rename-to:"starship"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
    echo
fi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)