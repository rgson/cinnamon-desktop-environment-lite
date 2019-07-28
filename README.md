# cinnamon-desktop-environment-lite

This metapackage corresponds to the full Cinnamon desktop environment for
Debian, but with weaker relationships to the extra components to enable the
removal of unwanted components without removing the entire package.

## Background

Installing Debian with Cinnamon brings along a collection of software that is
useless to many users (e.g. Thunderbird, LibreOffice, various games).

Uninstalling the undesirable software is hard because the
[`cinnamon-desktop-environment`][1] metapackage depends (`Depends`) on these
packages. Removing them will thus break the dependency, causing the entire
desktop environment to be uninstalled. Even though these packages should
arguably be optional (`Recommends`/`Suggests`), this [will not change][3].

One solution (or work-around, if you will) is to install a more liberal,
equivalent metapackage (i.e. this one) instead, to preserve any desired
components while enabling the removal of others.

## Implementation

The package is a trivial metapackage (no content, only dependencies) build with
[`equivs`][2]. The package's `control` file is generated based on the original
`cinnamon-desktop-environment`'s control file, but with weaker
relationships to all non-essential extra packages. `Depends` becomes
`Recommends` and `Recommends` becomes `Suggests`.

## Usage

1. Install `cinnamon-desktop-environment-lite`
2. Remove `cinnamon-desktop-environment`
3. Remove any undesirable software

```sh
# Build and install the new metapackage
make && dpkg -i cinnamon-desktop-environment-lite_*.deb

# Remove the old metapackage
apt remove cinnamon-desktop-environment

# Remove any undesirable software, for example the GNOME games collection
apt remove gnome-games
```


<!-- References -->
[1]: https://packages.debian.org/stable/cinnamon-desktop-environment
[2]: https://packages.debian.org/stable/equivs
[3]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=771418
