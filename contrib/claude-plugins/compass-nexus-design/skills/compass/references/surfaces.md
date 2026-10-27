# Compass Nexus iQ surfaces

Read the one surface the prompt names. Each sets the scope, who the screen is for and the object
it is known by (Hallmark's signature). Regions list what the platform brief puts on the surface;
show only what the build has data or material for, and give every data region its four states
(loading, empty, error, full).

| Surface              | Scope                   | Who                                                             | Signature                                                                                             |
| -------------------- | ----------------------- | --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Website              | page build, job `hire`  | HR, admin and facilities heads at IT companies, campuses, ports | the booking-to-invoice chain shown with real material                                                 |
| Admin Command Centre | app screen              | Super Admin, Business Admin, Finance, Operations, Fleet Manager | today's trips on one shift strip, exceptions queued beside it                                         |
| Customer Portal      | app screen              | Customer Admin                                                  | the verification queue: completed trips awaiting Verify or Dispute, and the invoice they roll up into |
| Driver App           | app screen, phone first | Driver                                                          | today's run: the next pickup, full screen, one action that changes with the trip status               |
| Employee App         | app screen, phone first | Employee                                                        | my ride: the live trip with vehicle, driver, ETA and SOS on one screen                                |
| Documents            | print layout, A4        | Finance, Customer Admin                                         | the tax invoice with its trip sheet behind it                                                         |

## Website

- The page sells a service, so the proof is the operation itself: the product's screens, real
  routes, real fleet photographs the user supplies. Without them, library photographs of roads
  and campus gates in early light, credited.
- Direct accounts and partner operations may be described as kinds of work; named clients only
  with permission (`SKILL.md`, Record rules).
- The action is to talk to the team (a demo or a site survey), placed where B2B service sites put
  it per Hallmark `anatomy.md`.

## Admin Command Centre

- Regions: customers by account type, active contracts, vehicles and drivers on duty, today's
  trips by status, pending verification, pending invoices, outstanding payments, revenue and km
  this month, service, vehicle and driver alerts.
- Figures sit in one ruled summary row and in ledgers, never a wall of stat tiles; each figure
  links to the filtered ledger it counts.
- Alerts are a queue: the record, what is wrong, the one action. Expiring documents (insurance,
  permit, fitness, PUC, licence) sort by days left.
- Vehicle quality: an administrator configures the inspection criteria and thresholds. The screen
  shows inspection records against those criteria and never a score the records do not support;
  with none configured, the empty state says so and offers the setup.
- More than seven destinations, so a sidebar that collapses to a menu under 60rem.

## Customer Portal

- Regions: today's trips, active vehicles, completed trips, pending verification, pending and paid
  invoices, outstanding amount, service alerts, vehicle quality, trip performance, monthly km and
  spend, reports.
- Verify and Dispute are a pair on each pending trip and in bulk; Dispute asks for a reason and
  the trip shows Disputed until it resolves.
- Downloads (invoice, trip sheet, billing package) name their format, PDF or Excel, and size.
- Service requests: raise, then track, with the status and who holds it.

## Driver App

- One hand, outdoors: 48px controls, the primary action in thumb reach, day mode by default with
  night following the phone.
- The trip action steps with the status: Start trip, Passenger picked up, End trip. End trip asks
  for the odometer km and shows the GPS km beside it when the app has it.
- No show, cancellation and incident reporting are two taps from the trip; emergency assistance
  is on every trip screen.
- Document expiry alerts lead the day, not settings. Vehicle inspection is a checklist of the
  administrator's criteria.

## Employee App

- The live trip in the platform's status words, ETA, vehicle registration in mono, driver first
  name and photo where permitted, SOS on every trip screen.
- Booking, cancellation and no-show reporting confirm before they commit; feedback and a service
  rating are asked once, after the trip.

## Documents

- Day mode only, ink on paper; gold at most as one hairline. Mono for invoice numbers, trip IDs and
  registrations; tabular figures right-aligned.
- The tax invoice leaves a bound place for every field the platform issues: invoice number and
  date, billing period, customer and address, the billing entity's name, PAN, GSTIN and UDYAM, SAC,
  trip and vehicle summary, total km, rate, charges, taxable value, CGST and SGST or IGST, total,
  amount in words, payment terms, bank details where required, the verification code.
- The trip sheet follows as a ledger, one row a trip, each row carrying the trip ID the invoice
  line points to.
