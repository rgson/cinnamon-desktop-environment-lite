Section: metapackages
Priority: optional
Standards-Version: 3.9.2

Package: cinnamon-desktop-environment-lite
Version: ${VERSION}-1
Maintainer: Robin Gustafsson <robin@rgson.se>
Depends: cinnamon-core ${CORE_VERSION}
Recommends: ${RECOMMENDS}
Suggests: ${SUGGESTS}
Provides: cinnamon-desktop-environment
Replaces: cinnamon-desktop-environment (<= ${VERSION})
Description: Cinnamon desktop environment - full desktop with optional extras
 These are the extended components of Cinnamon, a desktop environment which
 provides advanced innovative features and a traditional user experience.
 .
 This metapackage corresponds to the full Cinnamon desktop environment for
 Debian, but with weaker relationships to the extra components to enable the
 removal of unwanted components without removing the entire package.
