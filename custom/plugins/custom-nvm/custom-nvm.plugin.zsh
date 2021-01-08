if [[ -z "$NVM_DIR" ]]; then
  export NVM_DIR="$HOME/.nvm"
fi

source "$NVM_DIR/nvm.sh" ${NVM_LAZY+"--no-use"}

# Call nvm when first using node, npm or yarn
if (( $+NVM_LAZY )); then
  function node npm yarn {
    unfunction node npm yarn
    nvm use default
    command "$0" "$@"
  }
fi

# Autoload nvm when finding a .nvmrc file in the current directory
# Adapted from: https://github.com/nvm-sh/nvm#zsh
if (( $+NVM_AUTOLOAD )); then
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [[ -n "$nvmrc_path" ]]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [[ "$nvmrc_node_version" = "N/A" ]]; then
        nvm install
      elif [[ "$nvmrc_node_version" != "$node_version" ]]; then
        nvm use
      fi
    elif [[ "$node_version" != "$(nvm version default)" ]]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }

  autoload -U add-zsh-hook
  add-zsh-hook chpwd load-nvmrc

  load-nvmrc
fi

unset NVM_LAZY NVM_AUTOLOAD
