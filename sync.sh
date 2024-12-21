#!/bin/bash

set -e

QUARTZ_PUBLISH_DIRECTORY="/Users/chaintng/Projects/obsidian/published/straw-hat-crews-edcth-2025/"
INDEX_FILE="🏴‍☠️🍻 Straw Hat Crews Costume for EDC.md"

# Store the current directory
current_dir=$(pwd)
cd $QUARTZ_PUBLISH_DIRECTORY

## Sync iCloud Notes to Quartz Directory
rsync -av --delete "$OBSIDIAN_ICLOUD_DIR/🏠 Personal/1. Projects/🏴‍☠️🍻 Straw Hat Crews Costume for EDC/" ./content/

## Copy Index files
cp -rf "./content/$INDEX_FILE" ./content/index.md

# Find and rename .md files with the same name as their folder to index.md
# cd content
# find . -type f -name "*.md" | while read -r file; do
#     dir=$(dirname "$file")
#     base=$(basename "$file")
#     if [[ "$base" == "$(basename "$dir").md" ]]; then
#         mv "$file" "$dir/index.md"
#         # Add or update frontmatter with title property
#         folder_name=$(basename "$dir")
#         sed -i '' -e "s/^---$/&\ntitle: $folder_name/" -e "/^title:/d" "$dir/index.md"
#     fi
# done

# cd $current_dir

git add .
git commit -nam "update"
git push
