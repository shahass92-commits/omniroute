# Upstream snapshot: Hallmark

- repo: https://github.com/Nutlope/hallmark
- path: skills/hallmark
- commit: 6033bab2a8051b5454552d2e8e6cb8f27c483a42
- version: 2.0.0
- upstream-date: 2026-10-27
- synced: 2026-10-27
- license: MIT (skills/hallmark/LICENSE, kept verbatim)

`skills/hallmark/` is a byte-for-byte copy of the commit above, except for the plugin's own
files listed in PATCHES.md (the Compass theme) and `references/themes/index.json`, which
`theme.mjs index` regenerates so the deal can see the Compass theme.
To update: `scripts/dev/sync-hallmark-plugin.sh <commit>` (needs a clone in `_references/hallmark`).
Any other local patch is documented in PATCHES.md under `## <snapshot commit>` and sent upstream.
