// engine.js — the "brain" of the game. PURE LOGIC ONLY.
//
// This file knows NOTHING about the screen, canvas, buttons or the mouse.
// It only knows about a "grid": a 2D array of cells where 1 = alive, 0 = dead.
// Keeping the rules separate from the drawing is what makes the project tidy
// (and easy to test). You will fill these functions in during Milestone 1.
//
// Golden rule for this file: NEVER change a grid you were given.
// Always build and RETURN a NEW grid. (See issue: nextGeneration.)

/**
 * Create a fresh grid filled with dead cells (all 0).
 *
 * @param {number} rows - how many rows
 * @param {number} cols - how many columns
 * @returns {number[][]} a rows x cols 2D array of 0s
 *
 * TODO(M1 — "Represent the grid"): build and return the 2D array.
 * Hint: an array of `rows` arrays, each of length `cols`, all values 0.
 */
export function createGrid(rows, cols) {
  throw new Error("Not implemented yet — see the 'Represent the grid' issue.");
}

/**
 * Count how many of the 8 neighbours around (row, col) are alive.
 *
 * @param {number[][]} grid
 * @param {number} row
 * @param {number} col
 * @returns {number} a number from 0 to 8
 *
 * TODO(M1 — "Count live neighbours"): look at the 8 surrounding cells.
 * Hint: loop dRow from -1..1 and dCol from -1..1, skip (0,0) (that's the
 * cell itself), and be careful not to read outside the edges of the grid.
 */
export function countLiveNeighbors(grid, row, col) {
  throw new Error("Not implemented yet — see the 'Count live neighbours' issue.");
}

/**
 * Compute the NEXT generation from the current grid, using Conway's 4 rules:
 *   1. A live cell with 2 or 3 live neighbours stays alive.
 *   2. A live cell with fewer than 2 neighbours dies (loneliness).
 *   3. A live cell with more than 3 neighbours dies (overcrowding).
 *   4. A dead cell with exactly 3 live neighbours becomes alive (birth).
 *
 * @param {number[][]} grid - the current generation (DO NOT modify it)
 * @returns {number[][]} a brand-new grid for the next generation
 *
 * TODO(M1 — "nextGeneration"): make a NEW grid, decide each cell from the
 * OLD grid using countLiveNeighbors(), and return the new grid.
 */
export function nextGeneration(grid) {
  throw new Error("Not implemented yet — see the 'nextGeneration' issue.");
}
