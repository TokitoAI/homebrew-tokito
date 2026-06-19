# homebrew-tokito

Homebrew tap for [Tokito](https://github.com/VtronTokito/tokito) — the AI-assisted desktop schematic studio.

## Install

```sh
brew tap VtronTokito/tokito
brew install tokito
```

Then:

```sh
tokito              # launch the studio
tokito --version    # print version
tokito --help
```

## Releases

Formulas are updated by hand against new GitHub Releases at
<https://github.com/VtronTokito/tokito/releases>. The macOS universal-binary
tarball asset on each release is what the formula points at; its
`.sha256` file is the value to paste into `Formula/tokito.rb`.

The source-of-truth template lives at
[`packaging/homebrew/Formula/tokito.rb`](https://github.com/VtronTokito/tokito/blob/master/packaging/homebrew/Formula/tokito.rb)
in the main repo. A future slice will open the formula-update PR
automatically from the release workflow.
