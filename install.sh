#!/bin/zsh

set -Eeuo pipefail
set -x

# create the folder for everything
mkdir ~/wallpaper
mkdir ~/wallpaper/wallpapers

# seed intial subreddits
echo 'surrealmemes\nprogrammingmemes' > ~/wallpaper/subreddits.txt

# location of main script
location=$(readlink -f ~/wallpaper/run-wallpaper.sh)

# download main scripts
curl -fsSL https://raw.githubusercontent.com/KindaOK/MacDesktopChanger/master/shell-wallpaper.sh > ~/wallpaper/shell-wallpaper.sh
curl -fsSL https://raw.githubusercontent.com/KindaOK/MacDesktopChanger/master/run-wallpaper.sh > ~/wallpaper/run-wallpaper.sh

# give exec permissions to the script
chmod +x $location

# add cron job (not a good way but it works)
echo "* */4 * * * .$(location)" | crontab