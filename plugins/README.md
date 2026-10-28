# Claude Code plugins

`.claude-plugin/marketplace.json` at the repository root lists the plugins this project recommends.

## superpowers

[obra/superpowers](https://github.com/obra/superpowers) (MIT) v7.0.1 — TDD, debugging and
collaboration skills. It is referenced from GitHub, pinned to commit
`2ce8aa15d05bd57213e6f746f953aafb7ded7a8b`, and is not vendored into this repository.

Install:

```text
/plugin marketplace add shahass92-commits/omniroute
/plugin install superpowers@omniroute-plugins
```

The plugin registers a `SessionStart` hook that injects its `using-superpowers` skill into every
session. Review upstream changes before moving the pinned `sha`.

Note: `CLAUDE.md` rewrites the superpowers default output paths (`docs/…`) to `_tasks/…`; that
override still applies when the plugin is installed.
