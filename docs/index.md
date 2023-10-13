# Auto Commit Msg

## Description
This repository contains a Bash script designed to analyze the content of a Git commit and automatically suggest a semantic versioning message. It utilizes OpenAI's GPT-3.5 Turbo engine to generate the commit message based on the changes staged for commit.

## Features
- Checks for required utilities (curl, jq)
- Verifies API Key
- Analyzes staged changes for commit
- Generates a semantic versioning commit message

## Dependencies
- curl
- jq

## Installation and Setup

For instructions on how to generate the required API key and set up this script as a Git hook, please refer to the [INSTALL.md](INSTALL.md) file.

## Usage
```bash
./auto-commit-msg/usr/local/bin/auto-commit-msg [COMMIT_MSG_FILE]
```

## Author
Ricardo Malnati

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

## Hashtags
- #Git
- #CommitMessage
- #SemanticVersioning
- #OpenAI
- #GPT-3.5
- #BashScript
