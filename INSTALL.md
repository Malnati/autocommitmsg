# Installation Guide for Auto Commit Msg

## Table of Contents
1. [Generating API Key](#generating-api-key)
2. [Encrypting API Key](#encrypting-api-key)
3. [Setting Up as Git Hook](#setting-up-as-git-hook)

---

## Generating API Key

1. **Navigate to OpenAI's Developer Dashboard**: Go to [OpenAI Developer Dashboard](https://platform.openai.com/signup) and sign up or log in.
2. **Create a New API Key**: Once logged in, click on "API Keys" in the sidebar and then click on "Create API Key".
3. **Set Permissions**: Choose the permissions you need. For this script, a basic permission should suffice.
4. **Generate and Copy**: Click on "Generate" and copy the generated API key.

---

## Encrypting API Key

### Encrypt the API Key
After generating the API key, encrypt it using OpenSSL with the following command:

```bash
echo -n "Your-Actual-API-Key-Here" | openssl enc -aes-256-cbc -pbkdf2 -out api_key.enc
```

You'll be prompted to enter a passphrase. Remember this passphrase, as you'll need it to decrypt the key later.

### Update `.gitignore`
To ensure the encrypted API key file is not committed to the repository, add the following line to your `.gitignore`:

```plaintext
# encrypted file
*.enc
```

For more details on `.gitignore`, you can refer to the [official documentation](https://git-scm.com/docs/gitignore).

---

## Setting Up as Git Hook

1. **Navigate to Your Repository**: Open your terminal and navigate to your local Git repository.

2. **Create a Hooks Directory**: If it doesn't already exist, create a `hooks` directory inside the `.git` directory of your repository.
    ```bash
    mkdir -p .git/hooks
    ```

3. **Move the Script**: Move the `auto_commit_msg.sh` script to the `hooks` directory and rename it to `prepare-commit-msg`.
    ```bash
    mv path/to/auto_commit_msg.sh .git/hooks/prepare-commit-msg
    ```

4. **Make it Executable**: Change the script permissions to make it executable.
    ```bash
    chmod +x .git/hooks/prepare-commit-msg
    ```

5. **Update the Script**: Open the `prepare-commit-msg` script and replace the `PASSPHRASE` placeholder with the passphrase you used to encrypt the API key.
    ```bash
    PASSPHRASE="YOUR-PHRASE-HERE"
    ```

6. **Test the Hook**: Stage some changes and try committing them. The hook should automatically generate a commit message.

For more details on Git hooks, you can refer to the [official documentation](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks).

---
