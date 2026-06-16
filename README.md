# Conway's Game of Life 🟩

A browser version of the famous [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)
— a tiny universe where cells live and die by four simple rules, and somehow
produce gliders, oscillators, and chaos.

This is a **learning project**: it's built step by step from GitHub issues,
using git, pull requests, and an AI coding helper. If you're the one building
it, start with **[SETUP.md](SETUP.md)** and then **[LEARNING_GUIDE.md](LEARNING_GUIDE.md)**.

## Run it

The code is split into JavaScript modules, which browsers only load over a
*server* (not a plain file). So serve the folder — pick one:

- **VS Code → Live Server** (easiest): install the *Live Server* extension,
  then right-click `index.html` → *Open with Live Server*. It auto-refreshes
  when you save.
- **Or a one-line server** in the project folder:
  ```bash
  python3 -m http.server 8000   # then open http://localhost:8000
  ```

> Opening `index.html` straight from the file manager won't work — the browser
> blocks module loading from files. That's normal; use a server.

## The rules of Life

Every cell is alive or dead. Each step, all cells update at once:

1. A live cell with **2 or 3** live neighbours **survives**.
2. A live cell with **fewer than 2** neighbours **dies** (loneliness).
3. A live cell with **more than 3** neighbours **dies** (overcrowding).
4. A dead cell with **exactly 3** live neighbours **becomes alive** (birth).

## Project layout

```
index.html          the page (canvas + buttons)
css/styles.css      how it looks
js/engine.js        the rules (pure logic, no drawing)
js/render.js        drawing the grid on the canvas
js/controls.js      buttons, slider, mouse
js/patterns.js      famous shapes (glider, blinker, block)
js/main.js          wires everything together
tests/engine.test.js  tests for the rules  (run: node --test)
board.sh            one-time: builds your GitHub project board
bootstrap.sh        one-time: creates the labels, milestones and issues
```

## Project board

All the work is tracked as GitHub issues, organized on a **project board** so you
can pick them up **in order**, top to bottom. Create your board once (after
`gh auth login`):

```bash
bash board.sh
```

This makes a board on your account, links it to this repo (look under the repo's
**Projects** tab), and adds every issue in order — Milestone 0 in **🎯 To Do**,
the rest waiting in **📋 Backlog**. As you work, move each card across the
columns: **📋 Backlog → 🎯 To Do → 🚧 In Progress → 👀 In Review → ✅ Done**.
See [LEARNING_GUIDE.md](LEARNING_GUIDE.md) for how to work the board.

## Tests

```bash
node --test
```

## Built by

aa1t0r, learning to code — one issue at a time. 🚀
