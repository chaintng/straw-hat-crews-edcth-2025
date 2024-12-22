#!/bin/bash

set -e

QUARTZ_PUBLISH_DIRECTORY="/Users/chaintng/Projects/obsidian/published/straw-hat-edcth-quartz/"

# Store the current directory
current_dir=$(pwd)
cd $QUARTZ_PUBLISH_DIRECTORY

## Sync iCloud Notes to Quartz Directory
rsync -av --delete "$OBSIDIAN_ICLOUD_DIR/🏠 Personal/1. Projects/🏴‍☠️🍻 Straw Hat Crews Costume for EDC/" ./content/

git status 
read -n 1 -s -r -p "Press any key to continue..."

git add .
git commit -nam "update"
git push
