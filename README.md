# homebrew-cortex

Homebrew tap for [Cortex](https://github.com/autumngarage/cortex) — the reflective layer of the [autumngarage](https://github.com/autumngarage) composition.

## Install

```bash
brew tap autumngarage/cortex
brew install autumngarage/cortex/cortex    # fully-qualified: homebrew-core also has a `cortex` (Prometheus long-term storage)
```

Then in any project:

```bash
cortex init
cortex doctor    # validate the scaffold
cortex           # status summary
```

## The trio

Cortex stands alone. It also composes by file contract with its two siblings — install all three for the full loop:

```bash
brew install autumngarage/touchstone/touchstone   # engineering standards + pre-push review
brew install autumngarage/sentinel/sentinel       # autonomous multi-provider agent cycles
brew install autumngarage/cortex/cortex           # project-local memory (this tap)
```

No tool depends on another at the code level. Cortex reads `.sentinel/runs/` and respects `.touchstone-config` *if present*, degrading gracefully when they are not.

## Contributing

The formula in this repo is updated by Cortex's release workflow. Bug reports against the CLI belong in [`autumngarage/cortex`](https://github.com/autumngarage/cortex/issues); issues with the tap itself (wrong SHA, broken install) belong here.
