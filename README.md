# AnonScripts

## Useful Unix Scripts for Anons

### Readme

Read the comments in the scripts for usage

### .ssh/config for anons

1. create another ssh rsa. [tips from github](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

2. edit your ssh config to something like below, keeping a normal github config & and a github-anon config

  `$ nano ~/.ssh/config`

  ```unix
  Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/your_normal_rsa
    IdentitiesOnly yes

  Host github-anon  
    HostName github.com
    User git
    IdentityFile ~/.ssh/anon_rsa
    IdentitiesOnly yes
  ```

### A ~/.zshrc config

```zsh
# ----------------------
# Git Aliases
# ----------------------
alias gaa='git add .'
alias gcm='git commit'

# perl5 if you need it
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# ---------
# browser
export BROWSER="Brave Browser"
```

### delete all *merged* git branches except master|develop|alpha

git branch --merged | egrep -v "(^\*|master|develop|alpha)" | xargs git branch -d

### delete all git branches except master|develop|alpha

git branch | egrep -v "(^\*|master|develop|alpha)" | xargs git branch -d
