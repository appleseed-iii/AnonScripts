# AnonScripts

## Useful Unix Scripts for Anons

### Readme

Read the comments in the scripts for usage

### Contents

1. [.ssh/config](#ssh-config)

2. [.zshrc](#zshrc-config)

3. [GitOwner script](GitOwner.sh)

---

<a name="ssh-config"/>

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

<a name="zshrc-config"/>

### A ~/.zshrc config

just run the following to update your local .zshrc

```zsh
cp zsh/.zshrc ~/.zshrc
source ~/.zshrc
```

### delete all *merged* git branches except master|develop|alpha

```zsh
git branch --merged | egrep -v "(^\*|master|develop|alpha)" | xargs git branch -d
```

### delete all git branches except master|develop|alpha

```zsh
git branch | egrep -v "(^\*|master|develop|alpha)" | xargs git branch -d
```

# Install Rectangle
https://github.com/rxhanson/Rectangle