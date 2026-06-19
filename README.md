# homebrew-tokito

Homebrew tap for [Tokito](https://github.com/VtronTokito/tokito) — the AI-assisted desktop schematic studio.

## Install

```sh
brew tap VtronTokito/tokito
brew trust VtronTokito/tokito   # required once — see "Why the trust step?" below
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
Error: Refusing to load formula vtrontokito/tokito/tokito from untrusted tap vtrontokito/tokito.
Run `brew trust --formula vtrontokito/tokito/tokito` or `brew trust vtrontokito/tokito` to trust it.
```

This isn't a defect in our formula — it's a one-time security gate
Homebrew now applies to every non-homebrew/* tap. `brew trust
VtronTokito/tokito` whitelists the whole tap; `brew trust --formula
VtronTokito/tokito/tokito` whitelists just this formula. Either is fine.

## Releases

The formula is updated by hand against new GitHub Releases at
<https://github.com/VtronTokito/tokito/releases>. The macOS universal-binary
tarball asset on each release is what the formula points at; its
`.sha256` file is the value pasted into `Formula/tokito.rb`.

The source-of-truth template lives at
[`packaging/homebrew/Formula/tokito.rb`](https://github.com/VtronTokito/tokito/blob/master/packaging/homebrew/Formula/tokito.rb)
in the main repo. A future slice will open the formula-update PR
automatically from the release workflow.
