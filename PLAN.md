# Game Design Document (GDD): Countdown Loop

## 1. Game Overview

- **Concept:** A fast-paced, single-level arcade game where the player must collect resources within a strict time limit to buy upgrades for subsequent rounds.
- **Theme Interpretation:** COUNTDOWN — Every round is a race against a depleting timer, creating urgent, high-stakes decision-making.
- **Scope:** Single scene, rapid restart loop, arcade-style progression.

---

## 2. Core Gameplay Loop

1. **The Round:** A timer starts (e.g., 30 seconds). The player moves around the arena collecting items.
2. **The Countdown:** When the timer hits zero, the round ends instantly.
3. **The Shop:** The player spends collected resources on upgrades (speed, collection radius, extra time).
4. **The Loop:** A new round begins with enhanced stats and a fresh batch of items.

---

## 3. Player Mechanics & Controls

- **Movement:** Snappy, responsive top-down or platformer movement (to be decided based on feel).
- **Upgrades:**
  - Speed Boost: Move faster to cover more ground.
  - Magnet / Radius: Collect items from further away.
  - Time Extension: Add seconds to each future round.

---

## 4. Art & Scope Management

- **Visuals:** Minimalist placeholder art (geometric shapes) to prioritize mechanics.
- **Audio:** Basic sound effects for collection, timer ticks, and round transitions.
