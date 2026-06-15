// engine.test.js — tests for the game rules. NO browser needed.
//
// Run from the project folder with:   node --test
//
// Why test the engine? Because Life has KNOWN answers. A "block" must stay
// exactly the same. A "blinker" must flip. If your rules are wrong, these
// tests fail instantly — much faster than squinting at the screen.
//
// One test below is fully written as an example. Finish the others (and add
// your own!) during the testing issue.

import { test } from "node:test";
import assert from "node:assert/strict";
import { createGrid, countLiveNeighbors, nextGeneration } from "../js/engine.js";

// ---- Example (already written): a BLOCK never changes -------------------
test("a 2x2 block is a still life (does not change)", () => {
  const block = [
    [0, 0, 0, 0],
    [0, 1, 1, 0],
    [0, 1, 1, 0],
    [0, 0, 0, 0],
  ];
  const next = nextGeneration(block);
  assert.deepEqual(next, block, "the block should look identical next generation");
});

// ---- TODO: a BLINKER flips between horizontal and vertical --------------
test("a blinker oscillates with period 2", () => {
  const horizontal = [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
  ];
  // TODO: write the expected `vertical` grid after one step, then:
  //   assert.deepEqual(nextGeneration(horizontal), vertical);
  //   assert.deepEqual(nextGeneration(vertical), horizontal); // back to start
  assert.ok(horizontal, "replace this line with the real assertions");
});

// ---- TODO: countLiveNeighbors returns the right number ------------------
test("countLiveNeighbors counts the 8 surrounding cells", () => {
  // TODO: build a tiny grid, pick a cell, and assert the neighbour count.
  assert.ok(createGrid, "replace this line with a real test");
});
