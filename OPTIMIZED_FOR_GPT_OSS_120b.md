# Optimization for GPT-OSS-120b

The Ruflo Assistant skill is deliberately engineered to be a lightweight, model-friendly overlay for the large GPT-OSS-120b model. Below are the concrete design decisions that keep token usage, latency, and memory overhead to a minimum while still unlocking Ruflo's powerful multi-agent capabilities.

## 1. Minimal Skill Metadata
- SKILL.md is ~ 900 bytes, far below the 2‑5 KB guideline for Opencode skills. This means the model only needs to parse a tiny YAML front-matter block when the skill is discovered.
- The skill declares just three tools (Bash, Read, Write). No sprawling tool list is loaded, which keeps the model's *tool-selection* prompt short.

## 2. Delegated Execution
- The Bash wrappers (ruflo-wrapper.sh and ruflo-plan.sh) merely call the Ruflo CLI via npx. All heavy computation (agent orchestration, vector search, GOAP planning) happens *outside* the LLM's inference process.
- Consequently, the model only receives the prompt (a single-line description of the task) and the tool results (e.g., a plan text), keeping the total token count well under typical limits.

## 3. Stateless Prompt Generation
- Each $ruflo-plan invocation constructs a fresh prompt that references $(pwd). There is no accumulation of historical chat context, preventing token blow-up over long sessions.

## 4. No Extra Dependencies
- The skill ships only the two Bash scripts and the SKILL definition. No additional npm packages or compiled binaries are bundled, ensuring a tiny download and rapid startup.

## 5. Compatibility with Opencode's GPT-OSS-120b Runtime
- Opencode's execution layer automatically streams tool calls and results back to the model. Because the skill requires only the basic Bash tool, the runtime overhead is negligible.
- The skill can be used in any Opencode project – just copy the folder to ~/.opencode/skills and start invoking $ruflo-wrapper and $ruflo-plan.

---
*This file documents why this skill is an ideal companion for large-parameter models like GPT-OSS-120b.*