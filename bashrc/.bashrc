alias vi=nvim
alias lg=lazygit

fzf_cd() {
	  local dir
	  dir=$(find ~/dev -type d \
	    -not -path "*/\.*" \
	    -not -path "*/node_modules*" | fzf)

	  [ -z "$dir" ] && return

	  local session
	  session=$(basename "$dir" | tr . _)

	  if tmux has-session -t "$session" 2>/dev/null; then
		    tmux attach -t "$session"
	  else
		    tmux new-session -s "$session" -c "$dir"
	  fi
}

new_script() {
	local dir=${2:-.}
	local file_name=$1

	if [[ -z $1 ]]; then
		read -p "Enter file name: " file_name
	fi

	local file_path="$dir/$file_name"

	if [[ -f "$file_path" ]]; then
		echo "Error: file already exists"
		return 1
	fi

	touch "$file_path"
	echo '#!/usr/bin/env bash' > "$file_path"
	chmod +x "$file_path"
	echo "Created: $file_path"
}



bind -x '"\C-f": fzf_cd'

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
