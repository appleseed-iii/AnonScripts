# Use this to set your ANON name & email in git config for the correct local repos
#
# To use:
# - add your anon name & email to the script
# - run like any unix script:
#     $ path_to_script/GitOwner.sh
# - if you are already in the correct directory you need to run:
#     $ ./GitOwner.sh
# - if you get a permission denied error you need to:
#     Verify your current permissions:
#     $ ls -la path_to_script/GitOwner.sh
#     Change your permissions to:
#     $ chmod 744 path_to_script/GitOwner.sh

# Set your ANON details:
NAME="your-name"
EMAIL="your-name@protonmail.com"

# script
echo "======= Updating git config name: $NAME & email: $EMAIL ======="
git config --local user.name $NAME
git config --local user.email $EMAIL

echo "======= UPDATED ======="
git config --local --list
echo "^^^^^^^ Confirm name & email are changed above ^^^^^^^"