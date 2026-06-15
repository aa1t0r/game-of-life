// render.js — everything about DRAWING on the canvas.
//
// This file turns numbers (the grid) into pixels. It does not contain any
// game rules — that lives in engine.js. Drawing and rules stay separate.

/**
 * Draw the empty grid: just the lines that divide the canvas into cells.
 * No live cells yet — only the "graph paper" background.
 *
 * @param {CanvasRenderingContext2D} ctx
 * @param {number} cols
 * @param {number} rows
 * @param {number} cellSize - the width/height of one cell in pixels
 *
 * TODO(M0 — "Render an empty grid"): draw vertical and horizontal lines.
 * Hint: ctx.beginPath(); ctx.moveTo(x, y); ctx.lineTo(x, y); ctx.stroke();
 * A line every `cellSize` pixels, from 0 to cols*cellSize / rows*cellSize.
 */
export function drawGridLines(ctx, cols, rows, cellSize) {
  throw new Error("Not implemented yet — see the 'Render an empty grid' issue.");
}

/**
 * Draw the living cells of a grid as filled squares.
 *
 * @param {CanvasRenderingContext2D} ctx
 * @param {number[][]} grid
 * @param {number} cellSize
 *
 * TODO(M2 — "Draw live vs dead cells"): loop over every cell; when it is 1,
 * fill a square at (col*cellSize, row*cellSize) of size cellSize.
 */
export function drawCells(ctx, grid, cellSize) {
  throw new Error("Not implemented yet — see the 'Draw live vs dead cells' issue.");
}
