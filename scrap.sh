# Paste below to your .bashrc
# Replace scrapbox_project_name with your own!

# Open Scrapbox page
scrapbox_project_name="machida-memo"

function scrap {
  local title="$@"
  local scrapbox_url="https://scrapbox.io/$scrapbox_project_name/$title"

  if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    # WSL
    explorer.exe $scrapbox_url
  elif [ "$(uname)" == 'Darwin' ]; then
    # MacOS
    open $scrapbox_url
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # Linux
    xgd-open $scrapbox_url
  else
    echo "Your platform is not supported."
  fi
}
