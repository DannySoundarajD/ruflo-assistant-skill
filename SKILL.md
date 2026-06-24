---
name: ruflo-assistant
description: Chat assistant using Ruflo agents for UI and planning.
---

# Ruflo Assistant Skill

Provides two commands:

- **ruflo-wrapper** – runs `npx ruflo init wizard` to start the Ruflo UI.
- **ruflo-plan** – runs `npx ruflo goal-plan` with a prompt that analyses the current repository and produces a detailed development plan.

## Tools

- Bash – to execute the wrapper and plan scripts.
- Read – optional, used by the plan script if it needs to inspect files.
- Write – for script output.

## Scripts

- `scripts/ruflo-wrapper.sh`
- `scripts/ruflo-plan.sh`

## Usage

Invoke from any Opencode chat session with the `$` prefix:

```
$ruflo-wrapper   # launches the UI
$ruflo-plan      # generates a development plan
```