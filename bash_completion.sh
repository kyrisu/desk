
_desk() {
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  opts="init list ls . go help version"

  case "${prev}" in
    .|go|e|edit)
      IFS=$'\n' tmp=( $(compgen -W "$(ls ~/.desk/desks/)" -- "${COMP_WORDS[$COMP_CWORD]}" ))
      COMPREPLY=( "${tmp[@]%.*}" )
      return 0
      ;;
    *)
      ;;
  esac

  if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
  fi
}

complete -F _desk desk
