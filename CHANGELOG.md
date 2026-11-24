# Changelog

All notable changes to Clover are listed here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and the project uses [Semantic Versioning](https://semver.org/).

<!--
How to use:
- While working, add each change under "Unreleased".
- When releasing: rename "Unreleased" to the version and date, bump
  `version:` in budget/pubspec.yaml, commit, then tag (git tag vX.Y.Z).
  The release workflow uses this section as the release notes.
-->

## [Unreleased]

## [0.1.0] - 2026-11-24

First release of Clover, a new app built on [Cashew](https://github.com/jameskokoska/Cashew)
(5.4.3) by James Kokoska (GPL-3.0).

### Added
- New name, identity and data folder (`~/.local/share/io.github.nergalzin.Clover`).
- Local-only: no Google account, no cloud sync. Local backups (with optional
  encryption and attachments), desktop notifications, tray icon, keyboard
  shortcuts, AppImage and Flatpak packaging.
- Everything else (budgets, transactions, goals, subscriptions, loans,
  graphs, CSV import, themes, translations) comes from Cashew.
