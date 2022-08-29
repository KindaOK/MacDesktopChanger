#!/bin/zsh
set -Eeuo pipefail
set -x

if [ ! -f subreddits.txt ]; then
    exit "Could not find subreddit configuration file"
fi

subreddit=$(cat subreddits.txt | sort -R | head -n 1)

if [ -z "$subreddit" ]; then
    exit "No subreddits on configuration file"
fi

json=$(curl -A "Little wallpaper getter" "https://api.reddit.com/r/$subreddit/top?t=day&limit=1&count=1")

if echo "$json" | egrep -q -E '"post_hint": ?"[^i][^m][^"]+"'; then
    echo "Not an image. Cannot set desktop background."
    exit -1
fi

# since all preview images are served from preview.reddit.com, we don't match anything that looks like that
image_url=$(echo "$json" | LC_CTYPE=C sed -nE 's|.*"url": "(https://[^p][^"]+)".*|\1|pg')

echo "\n\n\n"
echo $image_url
filename=$(echo "$image_url" | sed -nE 's/.+\/(.+)$/\1/p')

curl $image_url > "wallpapers/$filename"

osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$(pwd)/wallpapers/$filename\""