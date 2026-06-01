# My dotfiles and convenience scripts
Features:
- [Optional] Symlink the zshrc / fish config into your home folder
- [Optional] Install pipenv dependency manager for python convenience scripts

Clone repository and run:
```
./setup.sh
```

## Convenience scripts

`menu`      Interactive Textual menu for reviewing PRs.

Two tabs: **Production** (configrepo image-updater PRs awaiting your review) and **Reviews** (review-requested PRs across GitHub, excluding image-updater).

`←/→` switches tabs. Each tab shows its own hotkey legend. Defaults to the Production tab; pass `--tab reviews` to start on Reviews.
