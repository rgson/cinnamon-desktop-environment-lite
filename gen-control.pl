#!/usr/bin/perl

my ($version, $suggests, $recommends, $core_version);

# Parse original cinnamon-desktop-environment control file
while (<>) {
	if    (m/^Version:\s*(.+)$/)    { $version  = $1; }
	elsif (m/^Recommends:\s*(.+)$/) { $suggests = $1; }
	elsif (m/^Depends:\s*(.+)$/)    {
		$recommends = $_ = $1;
		# Exclude cinnamon-core
		if (m/^(?:(.+?)[,\s]*)?cinnamon-core\s*(\(.+?\))(?:[,\s]*(.+?))?$/) {
			$core_version = $2;
			($recommends = "$1, $3") =~ s/(^, |, $)//g;
		}
	}
}

print <<CONTROL
Section: metapackages
Priority: optional
Standards-Version: 3.9.2

Package: cinnamon-desktop-environment-lite
Version: $version-1
Maintainer: Robin Gustafsson <robin\@rgson.se>
Depends: cinnamon-core $core_version
Recommends: $recommends
Suggests: $suggests
Provides: cinnamon-desktop-environment
Replaces: cinnamon-desktop-environment (<= $version)
Description: Cinnamon desktop environment - full desktop with optional extras
 These are the extended components of Cinnamon, a desktop environment which
 provides advanced innovative features and a traditional user experience.
 .
 This metapackage corresponds to the full Cinnamon desktop environment for
 Debian, but with weaker relationships to the extra components to enable the
 removal of unwanted components without removing the entire package.
CONTROL
