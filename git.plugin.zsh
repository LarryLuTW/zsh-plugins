#
# Functions
#

function current_branch() {
  git_current_branch
}

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
compdef _git _git_log_prettily=git-log

# Check if main exists and use instead of master
function git_main_branch() {
  if [[ -n "$(git branch --list main)" ]]; then
    echo main
  else
    echo master
  fi
}

# Rename branch
function grename() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 old_branch new_branch"
    return 1
  fi

  # Rename branch locally
  git branch -m "$1" "$2"
  # Rename branch in origin remote
  if git push origin :"$1"; then
    git push --set-upstream origin "$2"
  fi
}


#
# Aliases
#

alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gc='git commit -v -m'
alias gc!='git commit -v --no-edit --amend'
alias gca='git commit -v -a -m'
alias gca!='git commit -v -a --no-edit --amend'

alias gs='git switch'
alias gsm='git checkout $(git_main_branch)'
alias gsb='git checkout $(git branch | fzf)'

alias gpristine='git reset --hard && git clean -dffx'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'

alias gl='git pull --rebase'

alias glg='git log --graph --decorate --oneline -m'
alias glga='git log --graph --all --decorate --oneline -m'

alias gm='git merge'
alias gma='git merge --abort'

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'

alias grv='git revert'

alias grh='git reset'
alias grhs='git reset --soft'
alias grhh='git reset --hard'

alias gss='git status -s'
alias gst='git status'

alias gt='git tag'

alias gitify="g init && gaa && gc Init && hub create && gpsup"
alias gitifyp="g init && gaa && gc Init && hub create -p && gpsup"
