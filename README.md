# Group Theory Foundations in Lean 4

An introductory formalization of four fundamental group theory results using Lean 4 and Mathlib.

The project presents explicit, step-by-step algebraic proofs, connecting familiar mathematical arguments with machine-checked reasoning.

## Formalized Results

All results hold for an arbitrary group `G`; commutativity is not assumed.

| Theorem | Statement |
|---|---|
| `identity_unique` | If `e * a = a` for every `a`, then `e = 1`. |
| `inverse_unique` | If `a * b = 1`, then `b = a⁻¹`. |
| `left_cancellation` | If `a * b = a * c`, then `b = c`. |
| `right_cancellation` | If `b * a = c * a`, then `b = c`. |

## Proof Approach

The proofs use `calc` chains, associativity, identity laws, inverse laws, and rewriting with hypotheses.

Each step records an explicit equality and its justification. The proofs contain no `sorry` placeholders or additional axioms.

These are educational formalizations of standard results already available in Mathlib, developed to practice translating mathematical proofs into Lean.

## Project Files

- `GroupTheoryFoundations/Basic.lean`: theorem statements and proofs.
- `GroupTheoryFoundations.lean`: public entry point importing the proofs.
- `lean-toolchain`: Lean toolchain version.
- `lakefile.toml`: project configuration.
- `lake-manifest.json`: resolved dependency revisions.

## Build and Verify

With Git and Lean's Elan toolchain manager installed, open a terminal in the project directory and run:

```bash
lake exe cache get
lake build
```

Elan uses the version specified in `lean-toolchain`. Lake uses the dependency revisions recorded in `lake-manifest.json`.

A successful build checks the project's formal proofs.

## Explore the Proofs

Open the project in Visual Studio Code with the official Lean 4 extension, then open:

```text
GroupTheoryFoundations/Basic.lean
```

Move the cursor through a proof to inspect the intermediate goals in Lean InfoView.

## Author

Sepideh Nasseri

[GitHub](https://github.com/SepidehNasseri)