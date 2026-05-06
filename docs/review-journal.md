# Review Journal

I treated `prism-mesh-replica-gate` as a project where the smallest useful behavior should still be inspectable.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its distributed systems focus without claiming live deployment or external usage.

## Cases

- `baseline`: `quorum health`, score 166, lane `ship`
- `stress`: `lease drift`, score 98, lane `hold`
- `edge`: `replica lag`, score 222, lane `ship`
- `recovery`: `membership churn`, score 184, lane `ship`
- `stale`: `quorum health`, score 233, lane `ship`

## Note

A future change should add new cases before it changes the scoring rule.
