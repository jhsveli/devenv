# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal devenv repository containing dotfiles (.zshrc) and Python CLI tools for GitHub PR management.

## Setup

```bash
./setup.sh  # Interactive setup: optionally symlinks dotfiles and installs Python dependencies
```

## Running the CLI Tools

The tools require `gh` CLI to be installed and authenticated. Scripts are in `src/`:

```bash
prod    # Interactive menu for reviewing/merging image-updater PRs in configrepo
prs     # Interactive menu for reviewing PRs across all repos (excluding image-updater)
```

Run directly if `$DEVENV_DIR/src` is in PATH, or:
```bash
cd src && pipenv run python3 prod.py
cd src && pipenv run python3 prs.py
```

## Architecture

- `src/cmd.py` - Shared subprocess utilities for executing commands and parsing JSON
- `src/prod.py` - Image updater PR review tool (filters by username/mentions, requires SUCCESS checks)
- `src/prs.py` - General PR review tool with keyboard shortcuts: [a]pprove, [m]erge, [o]pen in browser
- `src/prod`, `src/prs` - Bash wrappers that run the Python scripts via pipenv
- `dotfiles/.zshrc` - Shell configuration with aliases and environment setup

## Dependencies

- Python 3.13 with pipenv
- `gh` CLI for GitHub API access (uses GraphQL queries)
- `simple-term-menu` for interactive terminal menus

## Environment Variables

- `DEVENV_DIR` - Path to this repository (set in .zshrc, used by wrapper scripts)
