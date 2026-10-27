# Compass Nexus iQ Design: a Claude Code plugin

Every screen Claude builds for Compass Nexus iQ comes out in one premium, consistent system and
passes Hallmark's checks against the tells of AI-generated UI. The plugin bundles:

| Part                                           | What it does                                                                                                                                                                                                                                                                                                                                                                                                |
| ---------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `skills/compass`                               | The brand entry point. Runs Hallmark with the Compass theme fixed, maps each surface (website, admin command centre, customer portal, driver app, employee app, invoices) to the right scope, and adds the platform's record rules: no invented trips or invoices, Direct vs Sub-vendor always visible, the billing identity bound from the contracting entity, masked personal data, AI provenance labels. |
| `skills/hallmark`                              | [Hallmark](https://github.com/Nutlope/hallmark) 2.0.0 by Nutlope / Together AI, vendored verbatim (MIT). The design flow, 50 themes, gates and the `sloplint` checker.                                                                                                                                                                                                                                      |
| `skills/hallmark/references/themes/compass.md` | The Compass theme, a 51st catalog theme: porcelain paper, deep navy ink, one navy band, a single gold signal, frosted glass only over a real photograph or live map, Onest with IBM Plex Mono identifiers, day and night modes.                                                                                                                                                                             |
| `hooks/hooks.json`                             | Hallmark's edit-time Floor check, wired in automatically. After each write it lints Hallmark-stamped HTML/CSS (and components inside a project with a `.hallmark` folder) and reports failures to Claude. It never blocks a write.                                                                                                                                                                          |

## Install

In Claude Code 2.1.275 or later, one step:

```
/plugin install compass-nexus-design --marketplace shahass92-commits/omniroute
```

Or in two steps on any version:

```
/plugin marketplace add shahass92-commits/omniroute
/plugin install compass-nexus-design@compass-nexus
```

Adding the marketplace clones this repository, which is large. To try the plugin from a local
checkout instead:

```
claude --plugin-dir contrib/claude-plugins/compass-nexus-design
```

Requirements, from Hallmark: Node 18 or later for its scripts. The browser checks
(`sloplint --render`, screenshots) also need `npm i -g puppeteer-core` and Chrome; without them the
static checks still run.

If you already installed upstream Hallmark's lint hook with `install-hook.mjs`, remove it
(`node <hallmark>/scripts/install-hook.mjs --remove`), or every write is linted twice.

## Use

```
/compass-nexus-design:compass the customer portal's trip verification screen
/compass-nexus-design:compass a landing page for Compass Nexus iQ
/compass-nexus-design:compass audit ./src/app/(dashboard)/trips
/compass-nexus-design:hallmark <any other build, in any of the 51 themes>
```

Describing a Compass Nexus iQ build in plain words also triggers the `compass` skill. Before
building, Hallmark asks once for material: screenshots or a running build, real figures, and the
client names you are allowed to show. It never invents them.

After the first build, say `lock the system` to write a `DESIGN.md` that every later screen
shares.

## The Compass theme

- **Palette:** porcelain paper `oklch(97.8% 0.006 255)`, navy ink `oklch(23% 0.06 262)`, a navy
  band `oklch(24% 0.075 263)`, gold `oklch(78% 0.13 82)` for the primary action, the selection on
  the band and a locked record only. Gold never sets text on paper (1.9:1, fails contrast).
- **Contrast** (WCAG, computed with Hallmark's own formula): muted on paper 5.39:1, muted on
  paper-2 5.00:1, navy ink on gold 8.60:1, focus ring on paper 6.29:1. Night: muted on paper
  7.22:1, navy ink on gold 10.22:1.
- **Dials**, stated in the page stamp: Mode `day` / `night` / `both`, Ground `road` / `map` /
  `none`.

The palette is a proposal built from the brand direction (premium blue and gold, glass,
light and dark). If Compass has official brand colours or fonts, give them to Claude and it will
re-derive the tokens. Hallmark never themes a real brand from memory.

## Updating Hallmark

`skills/hallmark` is pinned to the upstream commit in [UPSTREAM.md](UPSTREAM.md). To move to a new
commit:

```
git clone https://github.com/Nutlope/hallmark.git _references/hallmark
scripts/dev/sync-hallmark-plugin.sh <commit>
```

The script keeps the Compass theme, rebuilds `index.json`, rewrites `UPSTREAM.md`, and refuses to
overwrite local changes that [PATCHES.md](PATCHES.md) does not document. The vendored tree is
excluded from this repo's Prettier, ESLint, TypeScript and Docker contexts so it stays
byte-identical to upstream.

## Open items

- **Theme picture.** Each Hallmark theme ships a `<slug>.jpg` of a finished page that has passed
  `sloplint --render`, which the deal shows when picking themes. `compass.jpg` is not built yet.
  Build one Compass page, sweep it clean, then run
  `node skills/hallmark/scripts/picture.mjs compass <page.html> <y of the lower screen>`.
- **Upstream validators.** Run `node skills/hallmark/scripts/theme.mjs validate
skills/hallmark/references/themes/compass.md` and `node skills/hallmark/scripts/refcheck.mjs`
  once in a trusted environment. The theme was checked with an independent port of their rules,
  which agrees with upstream on all 50 stock themes.
- **Icon.** Add a square PNG at `.claude-plugin/icon.png` (512 to 2048 px) before submitting to a
  plugin directory.

## Credits and licence

Hallmark is by [Nutlope](https://github.com/Nutlope) and Together AI, MIT-licensed; its licence
is kept at `skills/hallmark/LICENSE`. Its photo library lists Wikimedia Commons photographs, each
under its own licence (CC0, public domain, CC BY or CC BY-SA), and Hallmark credits every one it
uses on the page. The Compass theme, the `compass` skill and the plugin wiring are MIT, like the
rest of this repository.
