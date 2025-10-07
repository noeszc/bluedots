#_ALIASES ---------------------------------------------------------------------

# System Utilities
alias unmount_all_and_exit='unmount_all && exit'
alias c='clear'

# macOS clipboard compatibility with wl-clipboard (Wayland)
alias pbcopy='wl-copy'
alias pbpaste='wl-paste'

# Text Editors
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Notes
alias zn='vim $NOTES_DIR/$(date +"%Y%m%d%H%M.md")'

# Tmux
alias ta='tmux attach -t'

# File Listing
alias l='eza -lah'
alias ls=eza
alias sl=eza

# Source Zsh
alias s='source ~/.zshrc'

# Heroku
alias h=heroku

# JSON Pretty Print
alias jj='pbpaste | jsonpp | pbcopy'

# Move to Trash
alias rm=trash

# Trim Whitespace
alias trim="awk '{\$1=\$1;print}'"

# Navigate Notes Directory
alias notes="cd $NOTES_DIR && nvim 00\ HOME.md"

# GIT ALIASES -----------------------------------------------------------------

# Git Basics
alias gc='git commit'
alias gco='git checkout'
alias ga='git add'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch -D'
alias gcp='git cherry-pick'

# Git Diffs
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias grs='git restore --staged'

# Git Status
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || eza'

# Git Reset
alias gu='git reset --soft HEAD~1'

# Git Prune
alias gpr='git remote prune origin'
alias ff='gpr && git pull --ff-only'

# Git Rebase
alias grd='git fetch origin && git rebase origin/master'

# Git Branch Switching
alias gbb='git-switchbranch'
alias gbf='git branch | head -1 | xargs' # top branch

# Git Logs
alias gl=pretty_git_log
alias gla=pretty_git_log_all

# Current Git Branch
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"

# Git Rebase Continue/Abort
alias grc='git rebase --continue'
alias gra='git rebase --abort'

# Git Edit Conflicts
alias gec='git status | grep "both modified:" | cut -d ":" -f 2 | trim | xargs nvim -'

# Git Amend Last Commit
alias gcan='gc --amend --no-edit'

# Git Push and Open Pull Request
alias gp="script -qec 'git push -u' /dev/null 2>&1 | tee >(cat) | grep 'pull/new' | awk '{print \$2}' | xargs xdg-open"

# Git Force Push with Lease
alias gpf='git push --force-with-lease'

# Git Branch Management
alias gbdd='git-branch-utils -d'
alias gbuu='git-branch-utils -u'
alias gbrr='git-branch-utils -r -b develop'

# Git Interactive Branch Switch
alias gg='git branch | fzf | xargs git checkout'

# Set Upstream Branch
alias gup='git branch --set-upstream-to=origin/$(git-current-branch) $(git-current-branch)'

# git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpmGit Checkout Next/Previous Commit
alias gnext='git log --ancestry-path --format=%H ${commit}..master | tail -1 | xargs git checkout'
alias gprev='git checkout HEAD^'

# FUNCTIONS -------------------------------------------------------------------

# Create a Directory and Navigate to It
function take {
    mkdir -p $1
    cd $1
}

# Log Notes with Date
note() {
    echo "date: $(date)" >> $HOME/drafts.txt
    echo "$@" >> $HOME/drafts.txt
    echo "" >> $HOME/drafts.txt
}

# Unmount All External Disks
function unmount_all {
    diskutil list \
                  | grep external \
                  | cut -d ' ' -f 1 \
                    | while read file; do
            diskutil unmountDisk "$file"
        done
}

# Fast-Forward Merge
mff()  {
    local curr_branch=$(git-current-branch)
    gco master
    ff
    gco $curr_branch
}

# Extract Audio and Video from Media File
extract-audio-and-video()  {
    ffmpeg -i "$1" -c:a copy obs-audio.aac
    ffmpeg -i "$1" -c:v copy obs-video.mp4
}

# Show HTTP Status
hs()  {
    curl https://httpstat.us/$1
}
