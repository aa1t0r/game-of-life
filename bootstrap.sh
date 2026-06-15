#!/usr/bin/env bash
#
# bootstrap.sh — fills the GitHub repo with labels, milestones and issues.
#
# You don't have to run this (it was run for you once). But READ it: it shows
# exactly what a project board is made of. You can re-run it safely — labels
# and milestones won't duplicate, though issues will, so only run once.
#
# Usage:  ./bootstrap.sh
#
set -euo pipefail

REPO="aa1t0r/game-of-life"
echo "Setting up $REPO ..."

# ---------------------------------------------------------------- labels ---
mklabel() { gh label create "$1" --color "$2" --description "$3" --force --repo "$REPO" >/dev/null && echo "  label  $1"; }

echo "Labels:"
mklabel "type:feature"     "1d76db" "A piece of work to build"
mklabel "type:bug"         "d73a4a" "Something is broken"
mklabel "type:docs"        "0075ca" "Writing / documentation"
mklabel "type:setup"       "5319e7" "Tooling and project setup"
mklabel "good first issue" "7057ff" "A gentle place to start"
mklabel "difficulty:easy"   "c2e0c6" "Small and quick"
mklabel "difficulty:medium" "fef2c0" "Needs some thinking"
mklabel "difficulty:hard"   "f9d0c4" "A real challenge"
mklabel "priority:high"    "b60205" "Do this soon"
mklabel "priority:med"     "fbca04" "Normal"
mklabel "priority:low"     "0e8a16" "Nice to have"
mklabel "status:blocked"   "000000" "Stuck — needs help to continue"

# ------------------------------------------------------------ milestones ---
mkmilestone() {
  gh api "repos/$REPO/milestones" -f title="$1" -f description="$2" >/dev/null 2>&1 \
    && echo "  milestone  $1" || echo "  milestone  $1 (already exists)"
}

echo "Milestones:"
mkmilestone "M0 Setup"              "Tools, git, the board, and an empty grid on screen."
mkmilestone "M1 Engine"             "The rules of Life as pure logic."
mkmilestone "M2 Drawing"            "Draw cells and click to edit the grid."
mkmilestone "M3 Animation"          "Make it move: play/pause, speed, counters, go live."
mkmilestone "M4 Patterns & Polish"  "Gliders, themes, save/load."
mkmilestone "M5 Stretch"            "Your own ideas."

# ---------------------------------------------------------------- issues ---
mkissue() { # title  milestone  labels  body
  local title="$1" milestone="$2" labels="$3" body="$4"
  if [ -n "$milestone" ]; then
    gh issue create --repo "$REPO" --title "$title" --milestone "$milestone" --label "$labels" --body "$body" >/dev/null
  else
    gh issue create --repo "$REPO" --title "$title" --label "$labels" --body "$body" >/dev/null
  fi
  echo "  issue  $title"
}

echo "Issues:"

# ===== M0 — Setup ==========================================================
mkissue "Clone the repo and check you can push" "M0 Setup" "type:setup,good first issue,difficulty:easy" \
'## Goal
Get the code on your laptop and prove you can send changes back to GitHub.

## Acceptance criteria
- [ ] `gh auth login` done as **aa1t0r**
- [ ] repo cloned with `gh repo clone aa1t0r/game-of-life`
- [ ] `index.html` opens in the browser (shows the placeholder)
- [ ] you made a tiny edit to README, committed, and pushed it on a branch + PR

## AI tip
Ask OpenCode: "What does each git command in SETUP.md do?"'

mkissue "Connect OpenCode to the Melkor AI" "M0 Setup" "type:setup,difficulty:easy" \
'## Goal
Use the open-source coding model on the Melkor server from inside OpenCode.

## Acceptance criteria
- [ ] `MELKOR_LITELLM_KEY` set in your shell (dad gives you the key)
- [ ] `curl http://melkor:4000/health` responds OK
- [ ] OpenCode uses model `gpt-oss-20b` and answers "Explain what this repo does"

## AI tip
This whole issue is about meeting your helper. Once connected, ask it to give
you a tour of the project files.'

mkissue "Explore the project: understand every file" "M0 Setup" "type:docs,good first issue,difficulty:easy" \
'## Goal
Before building, understand the map. Ask your AI helper to explain each file.

## Acceptance criteria
- [ ] you can say in one sentence what each file in `js/` is for
- [ ] you understand why rules (engine) and drawing (render) are separate
- [ ] add one sentence to the README "Built by" line about yourself

## AI tip
Ask: "Explain js/engine.js to me like I am new to programming."'

mkissue "Create your project board and add the issues" "M0 Setup" "type:setup,difficulty:easy" \
'## Goal
Make the board you will live in for the rest of the project.

## Acceptance criteria
- [ ] new Project (Board) created under your account
- [ ] 5 columns: Backlog, To Do, In Progress, In Review, Done
- [ ] all current issues added to the board, this milestone in **To Do**

## AI tip
See SETUP.md step 5. Ask your AI helper what a "kanban board" is.'

mkissue "Render an empty grid on the canvas" "M0 Setup" "type:feature,difficulty:medium" \
'## Goal
Draw the "graph paper" — the grid lines — so the board looks like a grid.

## Acceptance criteria
- [ ] `drawGridLines(ctx, cols, rows, cellSize)` in `js/render.js` is implemented
- [ ] opening the page shows a grid of empty cells (no more placeholder)

## Files
`js/render.js`

## AI tip
Ask: "How do I draw vertical and horizontal lines on an HTML canvas?"'

# ===== M1 — Engine =========================================================
mkissue "Represent the grid as a 2D array" "M1 Engine" "type:feature,difficulty:easy" \
'## Goal
Make a data structure for the world: rows and columns of 0 (dead) and 1 (alive).

## Acceptance criteria
- [ ] `createGrid(rows, cols)` returns a rows x cols array filled with 0
- [ ] you can `console.log` a grid and it looks right

## Files
`js/engine.js`

## AI tip
Ask: "How do I make a 2D array in JavaScript filled with zeros?"'

mkissue "Count a cell's live neighbours" "M1 Engine" "type:feature,difficulty:medium" \
'## Goal
For any cell, count how many of its 8 neighbours are alive.

## Acceptance criteria
- [ ] `countLiveNeighbors(grid, row, col)` returns 0..8
- [ ] it does NOT crash on cells at the edges or corners

## Files
`js/engine.js`

## AI tip
Ask it to explain the "two nested loops from -1 to 1" trick. Watch the edges!'

mkissue "Compute the next generation (the 4 rules)" "M1 Engine" "type:feature,difficulty:medium" \
'## Goal
Apply Conways four rules to make the next step of the world.

## Acceptance criteria
- [ ] `nextGeneration(grid)` returns a **new** grid (the old one is unchanged)
- [ ] the four rules (survive / die-lonely / die-crowded / birth) are all there

## Files
`js/engine.js`

## AI tip
Remember the golden rule: build a NEW grid, decide each cell from the OLD one.'

mkissue "Wire up the Step button" "M1 Engine" "type:feature,difficulty:easy" \
'## Goal
Make the "Step" button advance the world by one generation.

## Acceptance criteria
- [ ] clicking **Step** calls `nextGeneration` and redraws
- [ ] (for now you can start from a random or hand-set grid)

## Files
`js/main.js`

## AI tip
See the ROADMAP comment in main.js — it shows the shape of this.'

mkissue "Write tests for the engine" "M1 Engine" "type:feature,difficulty:medium" \
'## Goal
Prove your rules are correct using famous patterns with known answers.

## Acceptance criteria
- [ ] `node --test` passes
- [ ] block stays the same, blinker flips and flips back, neighbour count tested

## Files
`tests/engine.test.js`

## AI tip
One test is already written for you. Ask: "Why does a blinker have period 2?"'

# ===== M2 — Drawing ========================================================
mkissue "Draw the live cells" "M2 Drawing" "type:feature,difficulty:medium" \
'## Goal
Show living cells as filled squares on the grid.

## Acceptance criteria
- [ ] `drawCells(ctx, grid, cellSize)` fills a square for every cell that is 1
- [ ] `main.js` calls it so stepping the world is now visible

## Files
`js/render.js`, `js/main.js`

## AI tip
Ask: "How do I fill a rectangle on a canvas at a given row and column?"'

mkissue "Click a cell to toggle it alive/dead" "M2 Drawing" "type:feature,difficulty:medium" \
'## Goal
Let the mouse paint the world.

## Acceptance criteria
- [ ] `cellFromMouseEvent(...)` turns a click into the right (row, col)
- [ ] clicking a cell flips it between alive and dead and redraws

## Files
`js/controls.js`, `js/main.js`

## AI tip
The tricky bit is turning pixel x/y into a cell. Ask about `getBoundingClientRect`.'

mkissue "Add Clear and Random buttons" "M2 Drawing" "type:feature,difficulty:easy" \
'## Goal
Two handy buttons: empty the world, or fill it randomly.

## Acceptance criteria
- [ ] **Clear** sets every cell to dead and redraws
- [ ] **Random** fills the grid with a random mix of alive/dead

## Files
`js/main.js` (and maybe `js/engine.js`)

## AI tip
Ask: "How do I randomly set array values to 0 or 1 in JavaScript?"'

# ===== M3 — Animation ======================================================
mkissue "Play / Pause the simulation" "M3 Animation" "type:feature,difficulty:medium" \
'## Goal
Make the world run on its own, and stop when you want.

## Acceptance criteria
- [ ] **Play** steps the world automatically; **Pause** stops it
- [ ] clicking Play when already playing does NOT speed it up (see bug below!)

## Files
`js/main.js`, `js/controls.js`

## AI tip
Ask about `setInterval` and `clearInterval` — and remember to store the timer.'

mkissue "Speed slider" "M3 Animation" "type:feature,difficulty:easy" \
'## Goal
Control how fast generations happen.

## Acceptance criteria
- [ ] the slider changes the number of generations per second
- [ ] changing speed while playing works smoothly

## Files
`js/main.js`

## AI tip
The slider value is in the `#speed` input. Ask how to read it on change.'

mkissue "Generation and population counters" "M3 Animation" "type:feature,difficulty:easy" \
'## Goal
Show how many steps have passed and how many cells are alive.

## Acceptance criteria
- [ ] `#generation` increases each step
- [ ] `#population` shows the current count of live cells

## Files
`js/main.js`

## AI tip
Ask: "How do I count all the 1s in a 2D array?"'

mkissue "Deploy to GitHub Pages (go live!)" "M3 Animation" "type:docs,difficulty:easy,priority:high" \
'## Goal
Put your game on the internet with a real URL you can share. 🎉

## Acceptance criteria
- [ ] GitHub Pages enabled (Settings -> Pages -> deploy from `main`)
- [ ] the live URL works and is added to the README

## AI tip
Ask: "How do I host a static site for free on GitHub Pages?"'

# ===== M4 — Patterns & Polish =============================================
mkissue "Place preset patterns (glider, blinker, block)" "M4 Patterns & Polish" "type:feature,difficulty:medium" \
'## Goal
Add buttons that stamp famous shapes onto the grid.

## Acceptance criteria
- [ ] `placePattern(grid, pattern, top, left)` returns a new grid with the shape
- [ ] a button drops a GLIDER and it crawls across the screen

## Files
`js/patterns.js`, `js/main.js`

## AI tip
The patterns are already defined for you in patterns.js. Read them first.'

mkissue "Toggle edge behaviour: walls vs wrap-around" "M4 Patterns & Polish" "type:feature,difficulty:hard" \
'## Goal
Let the world either stop at the edges (walls) or wrap around (a donut!).

## Acceptance criteria
- [ ] a toggle switches between "walls" and "wrap"
- [ ] in wrap mode a glider leaving one side appears on the other

## Files
`js/engine.js`, `js/main.js`

## AI tip
Wrap-around uses the modulo `%` operator. Ask how `(row + rows) % rows` works.'

mkissue "Colours, theme and a responsive canvas" "M4 Patterns & Polish" "type:feature,difficulty:easy" \
'## Goal
Make it look the way YOU want, and fit different screen sizes.

## Acceptance criteria
- [ ] you changed the colours / style to your taste
- [ ] the canvas looks good on a smaller window

## Files
`css/styles.css`, `js/render.js`

## AI tip
Ask about CSS variables (the `--accent` etc. at the top of styles.css).'

mkissue "Save and load your grid" "M4 Patterns & Polish" "type:feature,difficulty:medium" \
'## Goal
Keep a creation so you can come back to it (or share it via a link).

## Acceptance criteria
- [ ] a Save button stores the current grid (localStorage or the URL)
- [ ] a Load button (or reopening the link) restores it

## Files
`js/main.js`

## AI tip
Ask: "What is localStorage and how do I save a JSON value in it?"'

# ===== M5 — Stretch ========================================================
mkissue "Pick a stretch idea and design it" "M5 Stretch" "type:feature,difficulty:medium,priority:low" \
'## Goal
Make the project YOURS. Choose one (or invent your own):

- Step backwards (remember past generations)
- Drag the mouse to paint many cells
- A chart of population over time
- A fade/trail effect for dying cells
- Import famous patterns from a file

## Acceptance criteria
- [ ] write a short plan in this issue first (what + how)
- [ ] build it on a branch and open a PR

## AI tip
Brainstorm with your helper, but YOU choose the idea.'

# ===== Bugs (you will probably meet these — practise the bug workflow) =====
mkissue "Bug: cells misbehave at the edges of the grid" "" "type:bug,difficulty:medium" \
'> This is a classic bug. When you build `countLiveNeighbors`, it is easy to
> read cells outside the grid by accident, which makes gliders vanish or the
> page error near the borders.

## What happens
A glider (or any pattern) breaks or disappears when it reaches the edge.

## What I expected
Cells at the edges should follow the same rules without crashing.

## Steps to reproduce
1. Place a glider and let it travel to a wall.
2. Watch the edge.

## Where to look
`countLiveNeighbors` in `js/engine.js` — are you checking the row/col are
inside the grid before reading them? Fix it on a `fix/` branch.'

mkissue "Bug: clicking Play twice makes it run double speed" "" "type:bug,difficulty:easy" \
'> Another classic. If Play starts a new timer every click without stopping the
> old one, timers stack up and the world speeds up.

## What happens
Pressing Play more than once makes the simulation faster and faster.

## What I expected
Play should run at one steady speed no matter how many times I click it.

## Steps to reproduce
1. Click Play several times.
2. Notice it accelerates.

## Where to look
The Play handler in `js/main.js`. Store the timer id and `clearInterval` the
old one (or ignore Play if already running) before starting a new timer.'

echo ""
echo "Done. Now go to your repo on GitHub and create the board (SETUP.md step 5)."
