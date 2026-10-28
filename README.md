# Opeaz Homebrew tap

Homebrew formulas for Opeaz tools.

```
brew install opeaz-team/tap/aval
```

| Formula | What it is |
|---|---|
| `aval` | The Aval command line: `aval plan get`, `aval plan push`, `aval auth login`. Needs Node.js 22 or newer (Homebrew installs it). |

Update with `brew update && brew upgrade aval`.

`Formula/aval.rb` is written by the `cli-homebrew` workflow of `Opeaz-Team/opeaz-aval` after each production deploy, from the release
that https://aval.opeaz.com serves (`/cli/latest.json`). Do not edit it by hand: the next run overwrites it. Without Homebrew, install
with `curl -fsSL https://aval.opeaz.com/install.sh | sh`.
