
GIT=false
JIRA=false
CONFLUENCE=false
ALL=false
while [[ $# -gt 0 ]]; do
  case $1 in
    -a|--all)
      ALL=true 
      shift
      ;;
    -c|--conf)
      CONFLUENCE=true
      shift
      ;;
    -j|--jira)
      JIRA=true
      shift
      ;;
    -g|--git)
      GIT=true
      shift
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

if  $GIT || $ALL  ; then
  git=$(ls | cat "references.json" | jq -r ".github")
  open -a "Google Chrome" $git
fi

if  $JIRA || $ALL  ; then
  jira=$(ls | cat "references.json" | jq -r ".jira")
  open -a "Google Chrome" $jira
fi

if $CONFLUENCE || $ALL  ; then
  confluence=$(ls | cat "references.json" | jq -r ".confluence")
  open -a "Google Chrome" $confluence
fi




