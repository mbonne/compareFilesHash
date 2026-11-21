# compareFilesHash

Check a downloaded file against its published hash without eyeballing two long strings.

Two small interactive shell scripts. `comphash` compares a file's hash with the one the publisher gave you and tells you whether they match. `gethash` prints every common hash for a file. Comparing by eye is tedious and error prone; these do it for you.

## Scripts

| Script | What it does |
|---|---|
| `comphash` | Prompts for a file path and the expected hash, lets you pick the algorithm, then reports match or mismatch. Case-insensitive, so upper-case published hashes work. |
| `gethash` | Prints SHA-1, SHA-256, SHA-512 and MD5 for a file. Pass the path as an argument or enter it when prompted. |

Supported algorithms: SHA-1, SHA-256, SHA-512, MD5.

## Requirements

- macOS (uses the built-in `shasum` and `md5`)
- bash

Not currently tested on Linux, where `md5` is not available by default.

## Install

```sh
mkdir -p "$HOME/bin"
ln -s "/path/to/compareFilesHash/comphash" "$HOME/bin/comphash"
ln -s "/path/to/compareFilesHash/gethash" "$HOME/bin/gethash"
```

Make sure `$HOME/bin` is on your `PATH` (add `export PATH="$HOME/bin:$PATH"` to `~/.zshrc` or `~/.bashrc`), then open a new terminal.

## Usage

```sh
comphash
# Enter Path To File: ~/Downloads/app.dmg
# Enter Files Correct Hash: <paste published hash>
# Select Hash comparison you need: 2   (SHA-256)

gethash ~/Downloads/app.dmg
```

## Caution

A matching hash only proves the file matches the hash you were given. If the download site is compromised, the published hash may be too. Treat this as one integrity check, not proof a file is trustworthy.

## License

GPL-3.0. See [LICENSE](LICENSE).
