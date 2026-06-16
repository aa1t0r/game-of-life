# Setup (one time, on the XPS laptop)

Do these with your dad the first time. After this you won't touch it again.

## 1. Tools

You already have **VS Code** and **OpenCode**. Check that you also have:

```bash
git --version          # version control
gh --version           # GitHub command line
node --version         # only needed for running tests
```

## 2. Log in to GitHub as yourself

```bash
gh auth login          # choose GitHub.com, account: aa1t0r
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
```

## 3. Get the code

```bash
gh repo clone aa1t0r/game-of-life
cd game-of-life
```

Serve the folder with VS Code's **Live Server** extension (right-click
`index.html` → *Open with Live Server*) — or run `python3 -m http.server 8000`
and open `http://localhost:8000`. You should see a dark box with a placeholder
message — that's normal until you build it. (Opening the file directly won't
load the code; browsers need a server for JavaScript modules.)

## 4. Connect OpenCode to the Melkor AI (your dad helps here)

The open-source coding models run on the home server **Melkor**. Your laptop
must be on the home Wi-Fi (or Tailscale) to reach it.

1. **Your dad** creates a personal AI key for you and gives it to you. You put it
   in your shell so OpenCode can use it (never put it in a file you commit):

   ```bash
   # add this line to ~/.bashrc (or ~/.zshrc), then restart the terminal
   export MELKOR_LITELLM_KEY="sk-...the key your dad gives you..."
   ```

2. Check the connection:

   ```bash
   curl http://melkor:4000/health      # should respond OK
   ```

3. The project already includes `opencode.json` pointing OpenCode at Melkor.
   Start OpenCode in the project folder and pick the model **`gpt-oss-20b`**.
   Test it: ask *"Explain what this repo does."*

> If `melkor` isn't found, ask your dad — you probably need to be on the home
> network or Tailscale. The AI server port is `4000` (not `11434`).

## 5. Make your project board

One command builds your board and fills it with every issue, in order:

```bash
bash board.sh
```

It creates the board on your account, links it to your repo, makes the 5
columns (📋 Backlog · 🎯 To Do · 🚧 In Progress · 👀 In Review · ✅ Done) and
adds the issues — Milestone 0 in **To Do**, the rest in **Backlog**.

Open the board (the script prints the link), switch the view layout to
**Board**, and group by **Stage** to see the columns. Then read
`LEARNING_GUIDE.md` — it explains how you'll work.

> Needs `jq` installed (`sudo apt install jq`) and `gh auth login` done as
> **aa1t0r**. Read `board.sh` first — it's short, and it shows how a board is
> built by a tool.
