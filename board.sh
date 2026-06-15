#!/usr/bin/env bash
#
# board.sh — creates YOUR GitHub project board and fills it with every issue,
# in order, ready to work through top to bottom.
#
# Run this ONCE, after you have logged in with `gh auth login` as aa1t0r:
#
#     bash board.sh
#
# What it does (read it — this is how a project board is built by a real tool):
#   1. creates a Projects board on your account
#   2. links it to your game-of-life repo (so it shows in the repo's Projects tab)
#   3. makes a "Stage" field with 5 columns (Backlog / To Do / In Progress /
#      In Review / Done) that match the loop in LEARNING_GUIDE.md
#   4. adds all the issues in order; Milestone 0 starts in "To Do", the rest
#      wait in "Backlog"
#
set -euo pipefail

OWNER="aa1t0r"
REPO="aa1t0r/game-of-life"
TITLE="Game of Life — Roadmap"

# --- checks ---------------------------------------------------------------
command -v gh >/dev/null || { echo "Please install the GitHub CLI (gh) first."; exit 1; }
command -v jq >/dev/null || { echo "Please install jq first (e.g. sudo apt install jq)."; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "Run 'gh auth login' as $OWNER first."; exit 1; }

# --- don't create a second board by accident ------------------------------
EXISTING=$(gh project list --owner "$OWNER" --format json | jq -r --arg t "$TITLE" '.projects[] | select(.title==$t) | .number' | head -1)
if [ -n "$EXISTING" ]; then
  echo "A board titled \"$TITLE\" already exists (#$EXISTING). Nothing to do."
  exit 0
fi

echo "Creating board \"$TITLE\" ..."
PROJ_JSON=$(gh project create --owner "$OWNER" --title "$TITLE" --format json)
PROJ_NUMBER=$(echo "$PROJ_JSON" | jq -r .number)
PROJ_ID=$(echo "$PROJ_JSON" | jq -r .id)
PROJ_URL=$(echo "$PROJ_JSON" | jq -r .url)
echo "  board #$PROJ_NUMBER  ($PROJ_URL)"

echo "Linking it to $REPO ..."
gh project link "$PROJ_NUMBER" --owner "$OWNER" --repo "$REPO" >/dev/null || echo "  (link skipped — you can link it from the repo's Projects tab)"
gh project edit "$PROJ_NUMBER" --owner "$OWNER" --visibility PUBLIC >/dev/null || true

echo "Creating the Stage field (the columns) ..."
FIELD_JSON=$(gh project field-create "$PROJ_NUMBER" --owner "$OWNER" --name "Stage" \
  --data-type SINGLE_SELECT \
  --single-select-options "📋 Backlog,🎯 To Do,🚧 In Progress,👀 In Review,✅ Done" --format json)
FIELD_ID=$(echo "$FIELD_JSON" | jq -r .id)
OPT_BACKLOG=$(echo "$FIELD_JSON" | jq -r '.options[] | select(.name | contains("Backlog")) | .id')
OPT_TODO=$(echo "$FIELD_JSON" | jq -r '.options[] | select(.name | contains("To Do")) | .id')

echo "Adding issues in order ..."
# Issues sorted by number; Milestone 0 -> To Do, everything else -> Backlog.
while IFS=$'\t' read -r num url milestone; do
  item=$(gh project item-add "$PROJ_NUMBER" --owner "$OWNER" --url "$url" --format json | jq -r .id)
  if [ "$milestone" = "M0 Setup" ]; then opt="$OPT_TODO"; col="To Do"; else opt="$OPT_BACKLOG"; col="Backlog"; fi
  gh project item-edit --id "$item" --project-id "$PROJ_ID" --field-id "$FIELD_ID" --single-select-option-id "$opt" >/dev/null
  echo "  #$num -> $col"
done < <(gh issue list --repo "$REPO" --state open --limit 200 \
          --json number,url,milestone \
          --jq 'sort_by(.number)[] | [(.number|tostring), .url, (.milestone.title // "none")] | @tsv')

echo ""
echo "Done!  Open your board:  $PROJ_URL"
echo "Tip: click the view, switch the layout to 'Board', and group by 'Stage'"
echo "     to see the 5 columns. Drag cards as you work (see LEARNING_GUIDE.md)."
