// patterns.js — famous Game of Life shapes you can drop onto the grid.
//
// Each pattern is a small list of [row, col] offsets of the cells that start
// alive, relative to a top-left corner. You'll use these in Milestone 4.
//
// These three are GIFTS to get you started (and to test your engine!):
//   - BLOCK   never changes        -> great test: it should look the same next gen
//   - BLINKER flips every step     -> great test: period of 2
//   - GLIDER  walks across the grid -> the classic "it's alive!" moment

/** A 2x2 square that stays perfectly still. */
export const BLOCK = [
  [0, 0], [0, 1],
  [1, 0], [1, 1],
];

/** Three cells in a row that flip between horizontal and vertical. */
export const BLINKER = [
  [0, 0], [0, 1], [0, 2],
];

/** The famous glider that crawls diagonally forever. */
export const GLIDER = [
  [0, 1],
  [1, 2],
  [2, 0], [2, 1], [2, 2],
];

/**
 * Stamp a pattern onto a grid at a given top-left position.
 *
 * @param {number[][]} grid
 * @param {number[][]} pattern - list of [rowOffset, colOffset]
 * @param {number} top - row to place the pattern's corner
 * @param {number} left - column to place the pattern's corner
 * @returns {number[][]} a NEW grid with the pattern added
 *
 * TODO(M4 — "Place preset patterns"): copy the grid, set each
 * [top+rowOffset][left+colOffset] to 1, return the new grid.
 */
export function placePattern(grid, pattern, top, left) {
  throw new Error("Not implemented yet — see the 'Place preset patterns' issue.");
}
