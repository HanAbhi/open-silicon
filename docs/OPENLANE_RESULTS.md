
## Physical Design Results

Run examined: `RUN_2026-10-19_12-32-43`

The completed OpenLane run generated a GDSII layout for
inspection in KLayout. The run reported passing DRC, LVS,
and antenna checks.

Relevant local report files:

- Magic DRC: `62-magic-drc/reports/drc_violations.magic.rpt`
- KLayout DRC: `63-klayout-drc/reports/drc_violations.klayout.xml`
- Antenna summary: `39-openroad-checkantennas/reports/antenna_summary.rpt`
- Final metrics: `final/metrics.json`

These paths refer to the local OpenLane run directory and
are not included in this repository.

## Limitations

This is an educational design experiment, not a fabricated
chip or production-ready silicon signoff.

The design is combinational and has no clock port. A generic
fallback SDC was used, so validated operating-frequency and
clock-timing signoff are not claimed.

The run also reported an IR-drop warning because no
`VSRC_LOC_FILES` were supplied.
