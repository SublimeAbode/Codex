#!/bin/bash

ROO_RULES_FILE=".roo/rules/rules.md"
FILES_TO_APPEND=(
  "CONTRIBUTING.md"
  # Add other files here as needed, e.g., "another_rule_file.md"
)

# Create the directory for the rules file if it doesn't exist
mkdir -p "$(dirname "$ROO_RULES_FILE")"

# Clear the rules file before appending, to ensure a fresh start
> "$ROO_RULES_FILE"

# Concatenate all specified files into the rules file, adding a newline after each
for file_path in "${FILES_TO_APPEND[@]}"; do
  if [ -f "$file_path" ]; then
    cat "$file_path" >> "$ROO_RULES_FILE"
    echo "" >> "$ROO_RULES_FILE" # Add a newline after each file's content
  else
    echo "Warning: File not found: $file_path"
  fi
done

echo "AI rules generation complete. Content written to $ROO_RULES_FILE"