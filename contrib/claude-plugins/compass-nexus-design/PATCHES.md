# Local changes to the vendored Hallmark tree

`scripts/dev/sync-hallmark-plugin.sh` keeps the files under **Plugin-owned files** across syncs and
fails on any other difference from the snapshot unless a `## <snapshot commit>` section below
documents it.

## Plugin-owned files

- `skills/hallmark/references/themes/compass.md`: the Compass Nexus iQ theme (a 51st catalog
  theme, so `theme.mjs scaffold compass` and the deal can use it).
- `skills/hallmark/references/themes/compass.jpg`: its picture, once one is built and swept
  (see README.md, "Open items").
- `skills/hallmark/references/themes/index.json`: regenerated to include the Compass entry. The
  sync script rebuilds it with `theme.mjs index`; never merge it by hand.

## Patches to upstream files

None.
