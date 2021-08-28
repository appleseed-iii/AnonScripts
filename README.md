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
