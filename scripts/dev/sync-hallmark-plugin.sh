#!/usr/bin/env bash
# Copies skills/hallmark from a clone of Nutlope/hallmark, at the requested commit, into the
# Compass Nexus design plugin (contrib/claude-plugins/compass-nexus-design/skills/hallmark),
# keeps the plugin's own additions (the files listed in LOCAL), rebuilds the theme index and
# rewrites UPSTREAM.md. Fails if the vendored tree carries changes PATCHES.md does not document.
# Usage: scripts/dev/sync-hallmark-plugin.sh <commit> [clone-path]
set -euo pipefail
COMMIT="${1:?usage: sync-hallmark-plugin.sh <commit> [clone]}"
MAIN=$(dirname "$(git rev-parse --path-format=absolute --git-common-dir)")
CLONE="${2:-$MAIN/_references/hallmark}"
ROOT=$(git rev-parse --show-toplevel)
PLUGIN="$ROOT/contrib/claude-plugins/compass-nexus-design"
DEST="$PLUGIN/skills/hallmark"
# Plugin-owned files inside the vendored tree. index.json is regenerated, never hand-merged.
LOCAL=(references/themes/compass.md references/themes/compass.jpg)
[ -d "$CLONE/.git" ] || { echo "hallmark clone not found at $CLONE (git clone https://github.com/Nutlope/hallmark.git $CLONE)" >&2; exit 1; }
git -C "$CLONE" cat-file -e "$COMMIT^{commit}" || { echo "commit $COMMIT not in the clone (git -C $CLONE fetch?)" >&2; exit 1; }

TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT

# 1) undocumented local diff against the previous snapshot?
PREV=$(grep -m1 -oE '^- commit: [0-9a-f]{40}' "$PLUGIN/UPSTREAM.md" 2>/dev/null | cut -d' ' -f3 || true)
if [ -n "$PREV" ] && [ -d "$DEST" ]; then
  mkdir -p "$TMP/prev"
  git -C "$CLONE" archive "$PREV" skills/hallmark | tar -x -C "$TMP/prev"
  EXCLUDES=(-x index.json); for f in "${LOCAL[@]}"; do EXCLUDES+=(-x "$(basename "$f")"); done
  if ! diff -rq "${EXCLUDES[@]}" "$TMP/prev/skills/hallmark" "$DEST" >/dev/null; then
    if ! grep -q "^## $PREV" "$PLUGIN/PATCHES.md" 2>/dev/null; then
      echo "skills/hallmark has local changes outside snapshot $PREV that PATCHES.md does not document" >&2
      diff -rq "${EXCLUDES[@]}" "$TMP/prev/skills/hallmark" "$DEST" >&2 || true
      exit 1
    fi
  fi
fi

# 2) set the plugin's own files aside, copy the requested commit, put them back
mkdir -p "$TMP/local"
for f in "${LOCAL[@]}"; do if [ -f "$DEST/$f" ]; then install -D -m 644 "$DEST/$f" "$TMP/local/$f"; fi; done
rm -rf "$DEST"; mkdir -p "$PLUGIN/skills"
git -C "$CLONE" archive "$COMMIT" skills/hallmark | tar -x -C "$PLUGIN"
for f in "${LOCAL[@]}"; do if [ -f "$TMP/local/$f" ]; then install -D -m 644 "$TMP/local/$f" "$DEST/$f"; fi; done
node "$DEST/scripts/theme.mjs" index
node "$DEST/scripts/theme.mjs" validate "$DEST"/references/themes/compass.md
VERSION=$(sed -n 's/^version: *//p' "$DEST/SKILL.md" | head -1)
DATE=$(git -C "$CLONE" show -s --format=%cs "$COMMIT")

# 3) UPSTREAM.md
cat > "$PLUGIN/UPSTREAM.md" <<MD
# Upstream snapshot: Hallmark

- repo: https://github.com/Nutlope/hallmark
- path: skills/hallmark
- commit: $COMMIT
- version: $VERSION
- upstream-date: $DATE
- synced: $(date -u +%Y-%m-%d)
- license: MIT (skills/hallmark/LICENSE, kept verbatim)

\`skills/hallmark/\` is a byte-for-byte copy of the commit above, except for the plugin's own
files listed in PATCHES.md (the Compass theme) and \`references/themes/index.json\`, which
\`theme.mjs index\` regenerates so the deal can see the Compass theme.
To update: \`scripts/dev/sync-hallmark-plugin.sh <commit>\` (needs a clone in \`_references/hallmark\`).
Any other local patch is documented in PATCHES.md under \`## <snapshot commit>\` and sent upstream.
MD
echo "ok: compass-nexus-design/skills/hallmark <- $COMMIT ($VERSION, $DATE)"
