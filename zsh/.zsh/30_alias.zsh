unamestr=$(uname)
if [[ "$unamestr" == "Linux" ]]; then
  alias ls='ls --color=auto'
else
  alias ls='ls -GF'
fi

