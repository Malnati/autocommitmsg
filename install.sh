#!/bin/bash

# Check for required utilities and install if not found
for util in openssl curl jq; do
    if ! command -v $util &> /dev/null; then
        echo "Warning: $util is not installed."
        echo "Attempting to install $util..."
        sudo apt-get update
        sudo apt-get install -y $util
        if ! command -v $util &> /dev/null; then
            echo "Error: Failed to install $util. Exiting."
            exit 1
        fi
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

# Generate a random passphrase for encrypting the API key
PASSPHRASE=$(openssl rand -base64 32)

# Encrypt the API key
echo -n "$API_KEY" | openssl enc -aes-256-cbc -pbkdf2 -out api_key.enc -pass pass:$PASSPHRASE

# Add encrypted file to .gitignore
echo "*.enc" >> .gitignore

# Copy the auto_commit_msg.sh script to hooks directory and rename it
cp ./auto_commit_msg .git/hooks/prepare-commit-msg

# Make the script executable
chmod +x .git/hooks/prepare-commit-msg

# Update the prepare-commit-msg script with the passphrase
sed -i "s/YOUR-PHRASE-HERE/$PASSPHRASE/" .git/hooks/prepare-commit-msg

echo "Installation complete."
