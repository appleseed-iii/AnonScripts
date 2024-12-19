# ----------------------
# Git Aliases
# ----------------------
alias gaa='git add .'
alias gco='git checkout'
# alias gcm='git commit'
alias mvenv='python3 -m venv .venv'
alias avenv='source .venv/bin/activate'
alias dvenv='deactivate'

# perl5 if you need it
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# ---------
# browser
export BROWSER="Brave Browser"

# -----
# node via fnm: https://github.com/Schniz/fnm?tab=readme-ov-file#shell-setup 
# sample fnm install command: fnm install --lts --corepack-enabled # globally?
eval "$(fnm env --use-on-cd --shell zsh --version-file-strategy=recursive --corepack-enabled)"

# good gpg directions: https://alexnorell.com/post/set-up-gpg/#what-is-gpg

# -----------------------------------------------------------------------------
# AI-powered Git Commit Function
# Copy paste this gist into your ~/.bashrc or ~/.zshrc to gain the `gcm` command. It:
# 1) gets the current staged changed diff
# 2) sends them to an LLM to write the git commit message
# 3) allows you to easily accept, edit, regenerate, cancel
# But - just read and edit the code however you like
# the `llm` CLI util is awesome, can get it here: https://llm.datasette.io/en/stable/
gcm() {
    # Check if -m flag is provideda
    if [ "$1" = "-m" ] && [ -n "$2" ]; then
        # Use the provided message directly
        if git commit -m "$2"; then
            echo "Changes committed successfully with your message!"
            return 0
        else
            echo "Commit failed. Please check your message and try again."
            return 1
        fi
    fi
    
    # Function to generate commit message
    generate_commit_message() {
        git diff --cached | llm "
Below is a diff of all staged changes, coming from the command:

\`\`\`
git diff --cached
\`\`\`

Please generate a concise, one-line commit message for these changes."
    }

    # Function to read user input compatibly with both Bash and Zsh
    read_input() {
        if [ -n "$ZSH_VERSION" ]; then
            echo -n "$1"
            read -r REPLY
        else
            read -p "$1" -r REPLY
        fi
    }

    # Main script
    echo "Generating AI-powered commit message..."
    commit_message=$(generate_commit_message)

    while true; do
        echo -e "\nProposed commit message:"
        echo "$commit_message"

        read_input "Do you want to (a)ccept, (e)dit, (r)egenerate, or (c)ancel? "
        choice=$REPLY

        case "$choice" in
            a|A )
                if git commit -m "$commit_message"; then
                    echo "Changes committed successfully!"
                    return 0
                else
                    echo "Commit failed. Please check your changes and try again."
                    return 1
                fi
                ;;
            e|E )
                read_input "Enter your commit message: "
                commit_message=$REPLY
                if [ -n "$commit_message" ] && git commit -m "$commit_message"; then
                    echo "Changes committed successfully with your message!"
                    return 0
                else
                    echo "Commit failed. Please check your message and try again."
                    return 1
                fi
                ;;
            r|R )
                echo "Regenerating commit message..."
                commit_message=$(generate_commit_message)
                ;;
            c|C )
                echo "Commit cancelled."
                return 1
                ;;
            * )
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}