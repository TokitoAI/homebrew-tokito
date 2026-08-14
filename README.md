# homebrew-tokito

Homebrew tap for [Tokito](https://github.com/TokitoAI/tokito) — the AI-assisted desktop schematic studio.

## Install

```sh
brew tap TokitoAI/tokito
brew trust TokitoAI/tokito   # required once — see "Why the trust step?" below
brew install tokito
```

Then:

```sh
tokito              # launch the studio
tokito --version
tokito --help
```

## Why the trust step?

Recent Homebrew versions block formula loads from third-party taps unless
the user explicitly trusts them, with:

```
Error: Refusing to load formula tokitoai/tokito/tokito from untrusted tap tokitoai/tokito.
Run `brew trust --formula tokitoai/tokito/tokito` or `brew trust tokitoai/tokito` to trust it.
```

This isn't a defect in our formula — it's a one-time security gate
Homebrew now applies to every non-homebrew/* tap. `brew trust
TokitoAI/tokito` whitelists the whole tap; `brew trust --formula
TokitoAI/tokito/tokito` whitelists just this formula. Either is fine.

## Releases

Formula updates are proposed as release-specific pull requests against this
protected tap. CI downloads the macOS universal archive and checksum sidecar,
requires both hashes to match the formula, rejects unsafe archive members, and
performs a real Homebrew install/test on macOS before merge.

The release template lives at
[`packaging/homebrew/Formula/tokito.rb`](https://github.com/TokitoAI/tokito/blob/master/packaging/homebrew/Formula/tokito.rb)
in the main repo. Release automation never pushes directly to `main`.
