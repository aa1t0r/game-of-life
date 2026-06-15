# Learning Guide 📚

Welcome! This project is less about the Game of Life and more about learning
**how real software gets built**: organizing a project, using git and GitHub,
working with an AI helper, and managing your work with a board of issues.

You'll build the game in small pieces. Each piece is a **GitHub issue**. For
every issue you'll run the same loop. Once you've done it a few times, it'll
feel natural — and that loop is exactly how professional teams work.

---

## The loop (do this for EVERY issue) 🔁

1. **Pick** an issue from the **🎯 To Do** column. Assign it to yourself and
   drag the card to **🚧 In Progress**.
2. **Make a branch** named after the issue number and topic:
   ```bash
   git switch -c feature/12-count-neighbours
   ```
3. **Understand before coding.** Ask your AI helper (OpenCode) to *explain the
   approach* — not to write everything. Read the explanation. Then start.
4. **Build in small steps.** Save and refresh the browser often. Tiny progress
   beats giant leaps.
5. **Commit** small, meaningful chunks:
   ```bash
   git add .
   git commit -m "feat: count live neighbours"
   ```
6. **Push** and open a **Pull Request**. In its description write `Closes #12`
   so the issue closes automatically when the PR merges. Move the card to
   **👀 In Review**.
7. **Get a review.** Your dad will read it and leave comments. Reply, and make
   any changes (more commits on the same branch).
8. **Merge** the PR, delete the branch, and watch the card move to **✅ Done**.
   ```bash
   git switch main
   git pull
   ```

> 🎉 Every merged PR = something new working in your game. Celebrate the small wins.

---

## Working with your AI helper 🤖

OpenCode (running the `gpt-oss-20b` model on the Melkor server) is your **tutor,
not a vending machine**. Use it well:

- **Ask "why" and "explain", not just "write it".** "Explain how to count
  neighbours" teaches you more than "give me the code".
- **Never paste code you don't understand.** If a line is confusing, ask it to
  explain that line — or to write a *simpler* version.
- **One small thing at a time.** Don't ask for the whole game at once.
- **You are the boss.** The AI suggests; *you* decide and *you* own the result.
- The PR checklist asks "I understand every line" — answer that honestly. It's
  for you, not for show.

---

## Git survival kit 🧰

```bash
git status                       # what's changed?
git switch -c feature/...        # start a new branch
git add .                        # stage your changes
git commit -m "type: message"    # save a snapshot
git push -u origin feature/...   # send branch to GitHub (first time)
git switch main && git pull      # get back to the latest main
```

**Commit message types:** `feat:` (new thing), `fix:` (bug fix), `docs:`
(writing), `refactor:` (tidy-up, no behaviour change). Example:
`fix: stop glider disappearing at the edge`.

---

## How the work is organized 🗂️

Work is grouped into **milestones**. Finish one before moving to the next —
each one ends with something you can *see* working.

| Milestone | You'll learn | You'll end with |
|---|---|---|
| **M0 Setup** | accounts, git, the board, OpenCode | tools working + an empty grid drawn |
| **M1 Engine** | data, functions, algorithms | the rules working (Step button) |
| **M2 Drawing** | canvas, mouse events | clickable, paintable grid |
| **M3 Animation** | the game loop, timing | Play/Pause + speed + a LIVE public URL |
| **M4 Patterns** | reusing data, UX, refactoring | gliders, themes, save/load |
| **M5 Stretch** | your own ideas | whatever you dream up |

Open the **Issues** tab to see every task. Start at the top of **M0**.

---

## Definition of "done" ✅

An issue is done when:
- it does what the issue's **acceptance criteria** say,
- you tested it (in the browser, or `node --test`),
- it's merged into `main` through a reviewed PR,
- and you could explain how it works to someone else.

Have fun. Build a universe. 🌌
