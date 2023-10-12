# Installation Guide for Auto Commit Msg

## Table of Contents
1. [Generating API Key](#generating-api-key)
2. [Setting Up as Git Hook](#setting-up-as-git-hook)

---

## Generating API Key

1. **Navigate to OpenAI's Developer Dashboard**: Go to [OpenAI Developer Dashboard](https://platform.openai.com/signup) and sign up or log in.
2. **Create a New API Key**: Once logged in, click on "API Keys" in the sidebar and then click on "Create API Key".
3. **Set Permissions**: Choose the permissions you need. For this script, a basic permission should suffice.
4. **Generate and Copy**: Click on "Generate" and copy the generated API key.

### Applying API Key to Source Code
Open the `auto_commit_msg.sh` script and locate the line where `API_KEY` is defined. Replace the placeholder `***` with your actual API key.

```bash
API_KEY="Your-Actual-API-Key-Here"
```

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

5. **Test the Hook**: Stage some changes and try committing them. The hook should automatically generate a commit message.
