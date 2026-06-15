// controls.js — connects the buttons, slider and mouse to the game.
//
// This file is the "remote control". It listens for clicks and other events
// and calls the right functions. You'll grow it across Milestones 2 and 3.
//
// It is left almost empty on purpose — wiring up controls is part of your
// learning. Each function below has an issue that explains what to build.

/**
 * Turn a mouse event on the canvas into a (row, col) cell position.
 *
 * @param {MouseEvent} event
 * @param {HTMLCanvasElement} canvas
 * @param {number} cellSize
 * @returns {{row: number, col: number}}
 *
 * TODO(M2 — "Click a cell to toggle"): use event.offsetX / offsetY (or
 * getBoundingClientRect) and divide by cellSize to find which cell was clicked.
 */
export function cellFromMouseEvent(event, canvas, cellSize) {
  throw new Error("Not implemented yet — see the 'Click a cell to toggle' issue.");
}

// More control wiring (Clear, Random, Play/Pause, Speed slider) will be added
// here as you reach those issues. Keep each handler small and well named.
