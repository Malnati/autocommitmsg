#!/bin/bash

# Check for required utilities
for util in openssl curl jq; do
    if ! command -v $util &> /dev/null; then
        echo "Error: $util is not installed. Exiting."
        exit 1
    fi
done

# Check if .git directory exists
if [ ! -d ".git" ]; then
    echo "Error: No .git directory found. Please run this script in a Git repository root."
    exit 1
fi

# Prompt for OpenAI API key
echo "Please enter your OpenAI API key:"
read -s API_KEY

# Prompt for passphrase to encrypt the API key
echo "Please enter a passphrase for encrypting the API key:"
read -s PASSPHRASE

# Encrypt the API key
echo -n "$API_KEY" | openssl enc -aes-256-cbc -pbkdf2 -out api_key.enc -pass pass:$PASSPHRASE

# Add encrypted file to .gitignore
echo "*.enc" >> .gitignore

# Create hooks directory if it doesn't exist
mkdir -p .git/hooks

# Copy the auto_commit_msg.sh script to hooks directory and rename it
cp path/to/auto_commit_msg.sh .git/hooks/prepare-commit-msg

# Make the script executable
chmod +x .git/hooks/prepare-commit-msg

# Update the prepare-commit-msg script with the passphrase
sed -i "s/YOUR-PHRASE-HERE/$PASSPHRASE/" .git/hooks/prepare-commit-msg

echo "Installation complete."
