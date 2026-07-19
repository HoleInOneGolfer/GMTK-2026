# GMTK Game Jam 2026

## Task Sorting Guide

| Marker     | Example              | Meaning                           |
| :--------- | :------------------- | :-------------------------------- |
| Priority   | (A) (B) (C)          | Priority level, A–Z               |
| Project    | +project             | Project label                     |
| Context    | @context             | Context label                     |
| Tag        | #tag                 | Freeform tag                      |
| Due date   | due:2025-06-01       | Due date in ISO format            |
| Completion | completed:2025-05-20 | Auto-appended on completion       |
| Custom     | key:value            | Any key:value pair (configurable) |

## Toolkit Setup

- [ ] (A) Scene Manager +toolkit @dev #core due:2026-07-21
      Core system for handling scene transitions and loading states.
- [ ] (A) Audio Manager +toolkit @dev #core due:2026-07-21
      BGM and SFX player with volume bus control.
- [ ] (B) Save System +toolkit @dev #data due:2026-07-21
      Resource-based persistent data management.
- [ ] (A) UI +toolkit @ui #frontend due:2026-07-21
  - [ ] (A) Main Menu +toolkit @ui due:2026-07-21
  - [ ] (A) Settings Menu +toolkit @ui due:2026-07-21
  - [ ] (B) Title Screen +toolkit @ui due:2026-07-21
  - [ ] (B) Intro Screen +toolkit @ui due:2026-07-21
  - [ ] (A) Pause Menu +toolkit @ui due:2026-07-21
  - [ ] (A) Game Over Screen +toolkit @ui due:2026-07-21

## Post-Theme Announcement Tasks

- [ ] (A) Define Game Name +planning @admin #setup due:2026-07-22
- [ ] (A) Rename Repository +infra @admin #setup due:2026-07-22
  - Change GitHub repository name in settings.
  - Update `origin` remote URL in local environment via `git remote set-url`.
  - Update CI/CD workflow file references.
- [ ] (A) Update Itch.io Project +infra @admin #setup due:2026-07-22
  - Update project display name to match game title.
  - Update project URL slug (if necessary).
- [ ] (B) Create Assets +art @assets #visuals due:2026-07-25
  - Design high-resolution cover art (1280x720).
  - Capture 3-5 high-quality gameplay screenshots.
- [ ] (A) Finalize Documentation +docs @admin #polish due:2026-07-26
  - Update README.md with game title, jam entry link, and build instructions.
  - Add credits and asset source attributions.
