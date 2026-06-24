# Ruflo Assistant Skill (Optimized for GPT‑OSS‑120b)

This repository contains a **global Opencode skill** that integrates the Ruflo multi‑agent system with any OpenCode environment. It provides two lightweight Bash scripts that:

1. **Launch the Ruflo UI** (`ruflo-wrapper`).
2. **Generate a detailed development plan** (`ruflo-plan`) using Ruflo’s `goal‑plan` skill, which coordinates all relevant agents.

The skill is deliberately minimal to keep the runtime overhead low, making it well‑suited for the **GPT‑OSS‑120b** model and similar high‑throughput workloads.

## Files

- `SKILL.md` – Skill definition (front‑matter, description, tools, usage).
- `scripts/ruflo-wrapper.sh` – Starts Ruflo via `npx ruflo init wizard`.
- `scripts/ruflo-plan.sh` – Calls `npx ruflo goal-plan` with an auto‑generated prompt.
- `README.md` – This document.

## Installation (global)

Copy the directory to your global Opencode skill path, e.g.:
```
mkdir -p ~/.opencode/skills
cp -r ruflo-assistant-skill ~/.opencode/skills/ruflo-assistant
```
Opencode will automatically discover the skill. You can then invoke the commands from any chat session with the `$` prefix:
```
$ruflo-wrapper
$ruflo-plan
```

## Publishing to GitHub

The repository is ready to be pushed to a new GitHub repo. After creating an empty repo (e.g. `your-username/ruflo-assistant-skill`), run:
```bash
cd ruflo-assistant-skill
git init
git add .
git commit -m "Add global Ruflo Assistant skill (optimized for GPT‑OSS‑120b)"
# Replace the URL with your repository URL
git remote add origin git@github.com:your-username/ruflo-assistant-skill.git
git push -u origin master
```
The skill can now be installed directly from the GitHub repository or shared with other Opencode users.

---
*Created by OpenCode to turn Ruflo into an optimized global skill for GPT‑OSS‑120b.*