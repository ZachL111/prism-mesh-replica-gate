# prism-mesh-replica-gate

`prism-mesh-replica-gate` keeps a focused SQL implementation around distributed systems. The project goal is to implement an SQL distributed systems project for replica event replay, using fixture event logs and golden state snapshots.

## Use Case

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Prism Mesh Replica Gate Review Notes

Start with `quorum health` and `lease drift`. Those cases create the widest score spread in this repo, so they are the best quick check when the model changes.

## Highlights

- `fixtures/domain_review.csv` adds cases for quorum health and lease drift.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/prism-mesh-replica-walkthrough.md` walks through the case spread.
- The SQL code includes a review path for `quorum health` and `lease drift`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Code Layout

The fixture data drives the tests. The code stays thin, while `metadata/domain-review.json` and `config/review-profile.json` explain what each case is meant to protect.

The SQL checks add a separate view over the domain review fixture.

## Run The Check

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Regression Path

The same command runs the local verification path. The highest-scoring domain case is `stale` at 233, which lands in `ship`. The most cautious case is `stress` at 98, which lands in `hold`.

## Future Work

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
