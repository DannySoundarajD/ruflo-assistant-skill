#!/usr/bin/env bash
# Generate a detailed development plan using Ruflo agents.
# This script invokes the Ruflo goal-plan skill with a prompt describing the repository.

PROMPT="Analyze the current project repository at $(pwd) and produce a detailed development plan with milestones, risks, and success criteria."

echo "Running Ruflo goal planning..."
# Use npx to run the latest Ruflo package.
npx ruflo goal-plan "$PROMPT"
