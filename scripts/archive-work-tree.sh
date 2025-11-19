#!/usr/bin/env bash

# Create a zip archive of the current Git work tree, including untracked files (excluding ignored files).
# Usage: ./archive-work-tree.sh output.zip

set -euo pipefail

# Check for output file argument
if [ -z "$1" ]; then
    echo "Usage: $0 <output_filename.zip>" >&2
    exit 1
fi

OUTPUT_ZIP="$1"

# Delete existing archive if it exists
if [ -f "$OUTPUT_ZIP" ]; then
    rm "$OUTPUT_ZIP"
fi

# Combine tracked files (--cached) and untracked files (--others --exclude-standard).
# Use -z for null-terminated output and xargs -0 for safe processing of filenames.
git ls-files -z --cached --others --exclude-standard \
    | xargs -0 zip "$OUTPUT_ZIP"

echo "Archive created successfully: $OUTPUT_ZIP"
