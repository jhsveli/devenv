# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal devenv repository containing dotfiles (.zshrc, fish config) and a Textual-based PR menu for GitHub PR review and merging.

## Setup

```bash
./setup.sh  # Interactive setup: optionally symlinks dotfiles and installs Python dependencies
```

## Running the PR menu

Requires `gh` CLI installed and authenticated. The bash wrapper is in `src/`:

```bash
menu                  # opens on the Production tab
menu --tab reviews    # opens on the Reviews tab
```

Run directly without the wrapper:
```bash
cd src && pipenv run python3 menu.py [--tab prod|reviews]
```

Inside the menu: `←/→` switches tabs, per-tab action keys are shown in the legend (Enter approve+merge on Production; `a`/`m`/`o` on Reviews), `q`/`esc` quits.

## Architecture

- `src/menu.py` - Entry point; argparse `--tab`, composes the two TabConfigs into one app via `pr_menu.run_pr_menu`.
- `src/pr_menu.py` - Generic Textual `PRMenuApp` hosting N tabs. Defines `TabConfig`, `ActionSpec`, `ActionResult`. Per-tab fetch loop, countdown/spinner, breadcrumb, hotkeys legend; shared bordered preview pane.
- `src/prod.py` - Exposes `TAB = TabConfig(...)` for the Production tab (image-updater PRs in configrepo, filtered to mentions/dependabot/SUCCESS checks; Enter = approve+merge).
- `src/prs.py` - Exposes `TAB = TabConfig(...)` for the Reviews tab (review-requested PRs across all repos, excluding image-updater; `a` approve, `m` approve+merge, `o` open in browser).
- `src/cmd.py` - `exec` / `exec_json` subprocess helpers.
- `src/menu` - One-line bash wrapper that runs `pipenv run python3 menu.py "$@"` with a `gh` presence check.
- `dotfiles/.zshrc`, `dotfiles/config.fish` - Shell configuration with aliases and environment setup.

## Dependencies

- Python 3.13 with pipenv
- `gh` CLI for GitHub API access (uses GraphQL queries)
- `textual` for the TUI

## Environment Variables

- `DEVENV_DIR` - Path to this repository (set in shell rc, used by the `menu` wrapper)
