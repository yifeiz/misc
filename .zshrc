
. /opt/homebrew/opt/asdf/libexec/asdf.sh

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U colors && colors
PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[magenta]%}%~ %{$reset_color%}%% "


### ALIASES ###
alias docker-arch-ps='for i in `docker ps --format "{{.Image}}"` ; do docker image inspect $i --format "$i -> {{.Architecture}} : {{.Os}}" ;done';
alias git-clean-branch='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias nuke="mutagen sync terminate --all; docker-compose down; yes | docker system prune -a; docker volume rm $(docker volume ls -q); rm ~/Library/Containers/com.docker.docker/Data/vms/0/data/Docker.raw;"
alias dcl="docker compose logs -t -f --tail 1000"
alias dcr="docker compose run --rm --user root"
gh() {
  git reflog --date=relative | grep checkout | sed -n -e 's/^.*{\(.*\)}.*to /\1|/p' | perl -ane '$H{$F[2]}++ or print' | column -t -s'|' | head -n15
}
