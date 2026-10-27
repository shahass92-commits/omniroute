---
name: compass
description: "Compass Nexus iQ brand design. Use when building or designing any Compass Nexus iQ or Compass Travel & Transportation surface: the website, the admin command centre, the customer portal, the driver app, the employee app, or an invoice or trip-sheet layout. Runs Hallmark with the Compass theme and the platform's record and data-honesty rules."
argument-hint: "<what to build> | redesign <path> | audit <path>"
---

# Compass Nexus iQ

Builds every Compass Nexus iQ surface in one system: Hallmark's floor and checks, the Compass
theme (porcelain paper, navy ink, one gold signal, glass only over a real ground, day and night),
and the rules a transport, billing and audit platform needs on screen.

## Who this is for

- **Product:** Compass Nexus iQ, "Intelligent Navigation". Always written `Compass Nexus iQ`
  (lowercase i, capital Q).
- **Operator:** Compass Travel & Transportation, Thiruvananthapuram, Kerala: employee
  transportation for IT companies, corporate campuses, industrial sites and ports.
- **Promise:** one traceable chain from booking to verified trip to invoice to payment. Every
  screen makes its part of that chain visible.

## Run

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/hallmark/SKILL.md` and follow its Flow in full. Its
   `<skill-dir>` is `${CLAUDE_PLUGIN_ROOT}/skills/hallmark`.
2. Fix these decisions instead of dealing them:
   - **Theme:** `compass`, by request (stamp `theme: Compass (by request)`). Only a user who
     names another theme or asks for custom leaves it; a `DESIGN.md` at the project root still
     outranks it.
   - **Genre:** modern-minimal.
   - **Dials:** Mode `both` for the apps (the platform ships light and dark; load
     `dark-mode.md`), `day` for the website unless asked. Ground `map` when the product's own map
     or screenshots exist, `road` otherwise; app screens use `none` except over a live map.
   - **Scope:** pick the surface in [`references/surfaces.md`](references/surfaces.md). The four
     apps are app screens (Hallmark `flow.md` § App screens, `sloplint --scope app`); the website
     is a page build; documents are print layouts.
3. Hallmark's Step 1 asks once. Audience and use come from the surface table; still ask for the
   **material**: screenshots or a running build, real figures, client names the user may show.
4. After the first build, offer `lock the system` so later screens share one `DESIGN.md`.

Existing screens follow Hallmark's rule: only `redesign <path>` or `audit <path>` runs the full
flow; any other change is made in the project's own system.

## Record rules

They bind on every surface, on top of Hallmark's Floor (gate 46a: never an invented fact).

- **Never invent records.** Trips, kilometres, rates, invoices, GST or PAN details, vehicles,
  drivers, approvals, payments, contracts, KPIs, testimonials and client logos come from the user
  or the system. A screen that needs rows to show its full state uses visibly fictional sample
  records (`TRP-SAMPLE-0001`, `KL-00-XX-0000`, `Sample Customer`) and says _Sample data_ in that
  region's header.
- **Clients are data, not decoration.** No logo wall, no "trusted by" row, and no client name on
  a public page unless the prompt gives permission. Inside the apps a client name appears only as
  a field of a record.
- **Account type is always visible.** Every customer, contract, trip and invoice record says
  _Direct account_ or _Sub-vendor account_ in words, never by colour alone.
- **The billing entity is bound, never hard-coded.** Invoice and agreement layouts take the
  business name, PAN, GSTIN, UDYAM number and address from the contracting entity's record. The
  proprietor profile and the firm profile are two identities: a template never mixes their
  fields and never bakes either one in.
- **Locked means locked.** A verified or billed trip is read-only. A correction is an audit entry
  with Old value, New value, Changed by, Date and time and Reason in columns, never an in-place
  edit and never an arrow glued between two values.
- **Every amount traces back.** An invoice line links to its trip ledger, the ledger to its
  trips, a trip to its vehicle, driver and route, as real navigation rather than tooltips.
- **Personal data is masked by default.** Licence numbers, phone numbers, verification status
  and home addresses show masked and unmask only for roles allowed to see them; the customer
  portal shows driver details only where the contract permits.
- **AI output is labelled by provenance.** Each value an AI produced or touched carries one of
  _Fact_, _Calculated_, _User-provided_, _Document-derived_ or _AI suggestion_, in text with one
  icon. A suggestion is never styled as a confirmed record, and an invoice is issued only after a
  visible human approval step.
- **Statuses use the platform's words,** sentence case, as text with one icon: Scheduled,
  Assigned, Driver en route, Vehicle arrived, Passenger picked up, Trip started, Trip completed,
  Cancelled, No show, Disputed, Verified, Billed.

## Hand-off

Close with Hallmark's material ask, then the Compass gaps: which regions hold sample data, which
client names still need permission, and which role unmasks which field.
