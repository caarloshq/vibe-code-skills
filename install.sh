#!/bin/bash

# Installs all skills from this repo into ~/.claude/skills/
# Usage:
#   ./install.sh              → installs to ~/.claude/skills/
#   ./install.sh --project    → installs to .claude/skills/ in current directory

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "$1" = "--project" ]; then
  INSTALL_DIR="$(pwd)/.claude/skills"
  SCOPE="project"
else
  INSTALL_DIR="$HOME/.claude/skills"
  SCOPE="global (~/.claude/skills)"
fi

echo "Installing vibe-code-skills to $INSTALL_DIR"
echo ""

mkdir -p "$INSTALL_DIR"

installed=0
skipped=0

for skill_dir in "$REPO_DIR"/skills/*/; do
  if [ -f "$skill_dir/SKILL.md" ]; then
    skill_name=$(basename "$skill_dir")
    target="$INSTALL_DIR/$skill_name"

    if [ -d "$target" ]; then
      rm -rf "$target"
    fi

    cp -r "$skill_dir" "$target"
    echo "  ✓ $skill_name"
    installed=$((installed + 1))
  else
    skipped=$((skipped + 1))
  fi
done

echo ""
echo "$installed skills installed ($scope)."

if [ "$SCOPE" = "global (~/.claude/skills)" ]; then
  echo "Restart Claude Code if this is your first install."
fi
