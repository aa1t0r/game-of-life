// main.js — the "conductor". It connects all the other files together.
//
// This is the only file that imports from the others. It sets up the canvas
// and, as you complete issues, you'll wire the engine, the rendering and the
// controls together here. Look for the ROADMAP comments below.

import { drawGridLines /*, drawCells */ } from "./render.js";
// import { createGrid, nextGeneration } from "./engine.js";   // ← M1
// import { cellFromMouseEvent } from "./controls.js";          // ← M2
// import { GLIDER, BLINKER, BLOCK, placePattern } from "./patterns.js"; // ← M4

// --- Settings you can tweak ---------------------------------------------
const COLS = 50;
const ROWS = 30;
const CELL_SIZE = 16; // pixels per cell
// ------------------------------------------------------------------------

const canvas = document.getElementById("board");
const ctx = canvas.getContext("2d");
canvas.width = COLS * CELL_SIZE;
canvas.height = ROWS * CELL_SIZE;

// On load, try to draw the empty grid. Until you implement drawGridLines()
// this will show a friendly placeholder telling you which issue to start with.
function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  try {
    drawGridLines(ctx, COLS, ROWS, CELL_SIZE);
  } catch (err) {
    drawPlaceholder(err.message);
  }
}

function drawPlaceholder(message) {
  ctx.fillStyle = "#0f1117";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.fillStyle = "#9aa4b2";
  ctx.font = "14px system-ui, sans-serif";
  ctx.textAlign = "center";
  ctx.fillText("Game of Life — your grid will appear here", canvas.width / 2, canvas.height / 2 - 10);
  ctx.fillText(message, canvas.width / 2, canvas.height / 2 + 12);
}

draw();

// ============================ ROADMAP ===================================
// Add these as you complete the matching issues. Keep it tidy!
//
// M1  Make a grid and show one step:
//       let grid = createGrid(ROWS, COLS);
//       document.getElementById("step").addEventListener("click", () => {
//         grid = nextGeneration(grid);
//         draw();                       // and call drawCells inside draw()
//       });
//
// M2  Draw living cells (call drawCells(ctx, grid, CELL_SIZE) inside draw())
//     and let clicks toggle cells using cellFromMouseEvent(...).
//
// M3  Play/Pause with setInterval or requestAnimationFrame, a speed slider,
//     and generation/population counters.
//
// M4  Buttons that stamp GLIDER / BLINKER / BLOCK using placePattern(...).
// ========================================================================
