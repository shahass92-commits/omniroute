---
name: Compass
slug: compass
genre: modern-minimal
paper: light 97.8 255
display: grotesk-sans Onest
accent: chromatic-gold 82
posture: restrained
keywords: mobility, transport, transportation, employee transport, corporate mobility, commute, shuttle, fleet, vehicles, drivers, trips, routes, dispatch, roster, navigation, logistics, operations, trip verification, billing, enterprise, b2b, compass, nexus
material: porcelain blue-white paper, deep navy ink and one navy band, Onest with IBM Plex Mono identifiers, frosted glass only over a photograph or live map, 16px corners, one gold signal
photo: natural con=4 sat=-8
---

# Compass

Corporate mobility at operations grade: porcelain paper with a blue cast, navy ink, one navy band where the product's records run, gold kept for the next thing to do. Glass is a frosted pane with a lit edge over a real photograph or the live map, never a frosted card on flat paper. Calm, exact and premium, a control room at shift change; not a luxury costume, a neon fleet dashboard or a gradient software page.

## Tokens

```css
:root {
  --color-paper: oklch(97.8% 0.006 255); --color-paper-2: oklch(95.2% 0.009 255); --color-paper-3: oklch(91.8% 0.012 255);
  --color-ink: oklch(23% 0.06 262); --color-ink-2: oklch(36% 0.045 260); --color-muted: oklch(51% 0.03 258);
  --color-rule: oklch(89% 0.012 255); --color-rule-2: oklch(82% 0.016 255);
  --color-navy: oklch(24% 0.075 263); --color-navy-2: oklch(29% 0.075 263); --color-navy-ink: oklch(95% 0.012 250); --color-navy-muted: oklch(74% 0.03 255); --color-navy-rule: oklch(34% 0.06 262);
  --color-accent: oklch(78% 0.13 82); --color-accent-hi: oklch(84% 0.12 84); --color-accent-ink: oklch(22% 0.06 262);
  --color-focus: oklch(48% 0.16 260); --color-light: oklch(100% 0 0);
  --glass: oklch(98% 0.006 255 / 0.64); --glass-navy: oklch(24% 0.07 263 / 0.58); --glass-blur: 20px;
  --glass-edge: inset 0 1px 0 oklch(100% 0 0 / 0.72), inset 0 0 0 1px oklch(100% 0 0 / 0.34);
  --glass-navy-edge: inset 0 1px 0 oklch(100% 0 0 / 0.14), inset 0 0 0 1px oklch(100% 0 0 / 0.08);
  --font-display: "Onest", ui-sans-serif, system-ui, sans-serif; --font-body: "Onest", ui-sans-serif, system-ui, sans-serif;
  --font-outlier: "IBM Plex Mono", ui-monospace, monospace;
  --radius-card: 16px; --radius-inner: 10px; --radius-input: 10px; --radius-pill: 999px; --rule-hair: 1px;
  --shadow-card: 0 1px 2px oklch(23% 0.06 262 / 0.06), 0 24px 48px -28px oklch(23% 0.06 262 / 0.28);
  --tracking-display: -0.024em; --display-weight: 600;
}
```

Two dials, stated in the stamp (`compass: day/road`).

| Dial | Options |
| --- | --- |
| **Mode** | `day` (default). `night`: the block below. `both`: one token system, per `dark-mode.md` |
| **Ground** | `road` (default): a library photograph of a road, campus gate or vehicle in early light. `map`: the product's own map. `none`: no glass |

```css
[data-mode="dark"] {
  --color-paper: oklch(16.5% 0.015 255); --color-paper-2: oklch(19.5% 0.017 255); --color-paper-3: oklch(22.5% 0.019 255);
  --color-ink: oklch(95% 0.01 262); --color-ink-2: oklch(84% 0.018 260); --color-muted: oklch(70% 0.022 258);
  --color-rule: oklch(31% 0.02 255); --color-rule-2: oklch(38% 0.024 255); --color-navy: oklch(21% 0.05 263);
  --color-accent: oklch(83% 0.11 82); --color-accent-hi: oklch(88% 0.1 84); --color-focus: oklch(72% 0.13 260);
}
```

## Type

- **Display:** Onest 600, `--tracking-display`, line-height 1.04, sentence case, one weight and one colour: ink, or navy ink on the band.
- **Body:** Onest 400 and 500 at 17px, line-height 1.55, leads in `--color-ink-2`; 350 at night.
- **Identifiers:** IBM Plex Mono 400 for what a system issued: trip IDs, vehicle registrations, invoice numbers. Never a label or a head.
- **Labels, table heads, status:** Onest 500 a step smaller, sentence case, untracked, muted. Figures in `tabular-nums`, the unit (km, min) after them in muted.

## Surfaces

- `--color-rule` hairlines split rows and edge panels; `--color-rule-2` edges fields. Neutrals lean blue, never grey.
- Radius steps by nesting: 16px panel, 10px inside it, pills on controls. `--shadow-card` on raised panels only; a flat panel is paper-2 with a hairline.
- Glass (`--glass`, or `--glass-navy` on dark) with its lit edge sits only over something real: the Ground photograph, the live map, the navy band. On flat paper it is a paper-2 panel. One layer deep.
- The navy band: navy under navy ink, `--color-navy-2` for a selected row, `--color-navy-rule` between rows. It holds the product's records; one a page, two on a long one.
- Photographs: real roads, gates and vehicles in early light, cropped wide, never a vehicle the client does not run.

## Range

- **A trip ledger:** ruled full width, trip ID in mono, km, status as a word with one icon. A verified row locks with a gold hairline at its left edge and opens to its audit line: old value, new value, who, when, why.
- **The chain of records:** on the band, invoice, billing period, trip ledger and one trip as ruled rows, each indented under its parent, so an amount traces back to the kilometre.
- **A shift as one strip:** 24 hours on one hairline, each trip a navy bar from pickup to drop, now a gold tick, a late pickup a dimension line in `--color-error`.
- **One figure set big:** a real figure from the prompt in Onest 600 at display size, its unit muted, one line on what it counts.

## Controls

- One primary: a gold pill, accent under accent ink, 48px, a lit top edge. Secondary: a ghost pill, `--color-rule-2` edge, ink text.
- Gold marks the next action, the selection on the band and a locked record, under 5% of a screen. Never gold text on paper: it fails contrast.
- Fields: paper, `--color-rule-2` edge, `--radius-input`, a 2px focus ring offset 2px, gold on the band. Options sit on a paper-3 track. Links: ink, `--color-rule-2` underline, focus blue on hover.

## Motion

`--dur-short` on `--ease-out` for hovers and panes; one reveal, a glass pane rising 8px as it fades in; a map route draws once. No parallax, no bounce, no loops. Reduced motion: still.

## Voice

A dispatch desk: the trip, the vehicle, the time, the status. No hype, no number nobody gave.

## Do-nots

- Never navy and gold as a luxury costume: no crest, no foil, no serif display, no gold gradient.
- Never glass on flat paper, glass on glass, or glass without its lit edge.
- Never a grid of stat tiles or an invented map.
- Never a compass rose, a north arrow or a route squiggle as ornament.

## Build hint

```html
<link href="https://fonts.googleapis.com/css2?family=Onest:wght@350..600&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">
```

```css
h1, h2, h3 { font-family: var(--font-display); font-weight: var(--display-weight); letter-spacing: var(--tracking-display); color: var(--color-ink); }
.id { font-family: var(--font-outlier); } .num { font-variant-numeric: tabular-nums; }
.btn { min-height: 48px; padding: 0 var(--space-lg); border: 0; border-radius: var(--radius-pill); background: var(--color-accent); color: var(--color-accent-ink); font: 600 var(--text-md)/1 var(--font-body); box-shadow: inset 0 1px 0 color-mix(in oklab, var(--color-light) 45%, transparent); transition: background-color var(--dur-short) var(--ease-out); }
.btn:hover { background: var(--color-accent-hi); }
.panel { background: var(--color-paper-2); border: var(--rule-hair) solid var(--color-rule); border-radius: var(--radius-card); }
.glass { background: var(--glass); border-radius: var(--radius-card); backdrop-filter: blur(var(--glass-blur)) saturate(1.4); box-shadow: var(--glass-edge), var(--shadow-card); }
.band { background: var(--color-navy); color: var(--color-navy-ink); --color-ink: var(--color-navy-ink); --color-focus: var(--color-accent); --glass: var(--glass-navy); --glass-edge: var(--glass-navy-edge); }
.ledger tr + tr td { border-top: var(--rule-hair) solid var(--color-rule); } .ledger tr[data-locked] td:first-child { box-shadow: inset 2px 0 0 var(--color-accent); }
```
