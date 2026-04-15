#!/bin/bash

# Installs all skills from this repo into ~/.claude/skills/
#
# Usage — local (from cloned repo):
#   ./install.sh              → installs to ~/.claude/skills/
#   ./install.sh --project    → installs to .claude/skills/ in current directory
#
# Usage — directly from GitHub (no clone needed):
#   curl -fsSL https://raw.githubusercontent.com/caarloshq/vibe-code-skills/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/caarloshq/vibe-code-skills/main/install.sh | bash -s -- --project

set -e

REPO_ZIP="https://github.com/caarloshq/vibe-code-skills/archive/refs/heads/main.zip"

if [ "$1" = "--project" ]; then
  INSTALL_DIR="$(pwd)/.claude/skills"
  SCOPE="project"
else
  INSTALL_DIR="$HOME/.claude/skills"
  SCOPE="global (~/.claude/skills)"
fi

# Detect if running locally (from cloned repo) or via curl
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || echo "")"

if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/skills" ]; then
  # Local: use skills from this directory
  SKILLS_DIR="$SCRIPT_DIR/skills"
else
  # Remote: download zip from GitHub
  echo "Downloading vibe-code-skills from GitHub..."

  if ! command -v curl &>/dev/null && ! command -v wget &>/dev/null; then
    echo "Error: curl or wget is required." >&2
    exit 1
  fi

  if ! command -v unzip &>/dev/null; then
    echo "Error: unzip is required." >&2
    exit 1
  fi

  TMP_DIR=$(mktemp -d)
  trap "rm -rf $TMP_DIR" EXIT

  if command -v curl &>/dev/null; then
    curl -fsSL "$REPO_ZIP" -o "$TMP_DIR/skills.zip"
  else
    wget -q "$REPO_ZIP" -O "$TMP_DIR/skills.zip"
  fi

  unzip -q "$TMP_DIR/skills.zip" -d "$TMP_DIR"
  SKILLS_DIR="$TMP_DIR/vibe-code-skills-main/skills"
fi

echo "Installing vibe-code-skills to $INSTALL_DIR"
echo ""

mkdir -p "$INSTALL_DIR"

installed=0

for skill_dir in "$SKILLS_DIR"/*/; do
  if [ -f "$skill_dir/SKILL.md" ]; then
    skill_name=$(basename "$skill_dir")
    target="$INSTALL_DIR/$skill_name"

    if [ -d "$target" ]; then
      rm -rf "$target"
    fi

    cp -r "$skill_dir" "$target"
    echo "  ✓ $skill_name"
    installed=$((installed + 1))
  fi
done

echo ""
echo "$installed skills installed ($SCOPE)."

if [ "$SCOPE" = "global (~/.claude/skills)" ]; then
  echo "Restart Claude Code if this is your first install."
fi
