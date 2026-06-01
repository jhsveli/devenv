# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal dotfiles repository (`.zshrc`, fish config). Previously also contained the PR menu tool — that was extracted into its own repo: [`seon`](https://github.com/jhsveli/seon).

## Setup

```bash
./setup.sh  # Optionally symlinks dotfiles into your home folder
```

## Layout

- `dotfiles/.zshrc`, `dotfiles/config.fish` — shell configuration with aliases and environment setup
- `setup.sh` — interactive symlinker

## Environment Variables

- `DEVENV_DIR` — Path to this repository (set in shell rc; previously used by tool wrappers, now mostly informational)
