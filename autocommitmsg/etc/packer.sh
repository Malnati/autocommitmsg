#!/bin/bash
# Script: packer.sh
# Author: Ricardo Malnati
# Creation Date: 2023-10-12
# Description: Converts all Markdown files in the 'docs/' directory to reStructuredText format using pandoc.
#              This is part of the migration from MkDocs to Read the Docs.
# Dependencies: pandoc

# Function to display help
show_help() {
  echo "Usage: packer.sh [OPTION]"
  echo "  -h  Display this help and exit."
}

# Handle options
while getopts ":h" opt; do
  case $opt in
    h)
      show_help
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 3
      ;;
  esac
done

# Navigate to the 'docs/' directory
cd docs || { 
  echo "Error: 'docs/' directory not found."; 
  echo "User Task: Ensure the 'docs/' directory exists in the current path.";
  exit 1; 
}

# Initialize a counter for converted files
converted_files=0

# Loop through each Markdown file in the 'docs/' directory
for file in *.md; do
  # Check if any Markdown files are present
  if [ -e "$file" ]; then
    # Increment the counter
    ((converted_files++))
    # Extract the filename without the extension
    filename="${file%.*}"
    # Run the pandoc command to convert the file
    pandoc --from=markdown --to=rst "$file" -o "${filename}.rst"
    echo "Converted $file to ${filename}.rst"
  else
    echo "No Markdown files found in 'docs/' directory."
    echo "User Task: Place Markdown files in the 'docs/' directory for conversion."
    exit 2
  fi
done

# Check if any files were converted
if [ $converted_files -eq 0 ]; then
  echo "No Markdown files were converted."
  exit 4
fi

# Exit successfully
echo "Conversion completed successfully."
exit 0