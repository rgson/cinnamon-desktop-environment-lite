#!/usr/bin/perl

my ($control, $template) = @ARGV[0,1];
my %vars = ();

open($control, '<', $control) or die $!;
open($template, '<', $template) or die $!;

# Parse original cinnamon-desktop-environment control file
while (<$control>) {
	if    (m/^Version:\s*(.+)$/)    { $vars{'VERSION'}  = $1; }
	elsif (m/^Recommends:\s*(.+)$/) { $vars{'SUGGESTS'} = $1; }
	elsif (m/^Depends:\s*(.+)$/)    {
		$vars{'RECOMMENDS'} = $_ = $1;
		# Exclude cinnamon-core
		if (m/^(?:(.+?)[,\s]*)?cinnamon-core\s*(\(.+?\))(?:[,\s]*(.+?))?$/) {
			$vars{'CORE_VERSION'} = $2;
			($vars{'RECOMMENDS'} = "$1, $3") =~ s/(^, |, $)//g;
		}
	}
}

# Produce new control file
while (<$template>) {
	s/\$\{(\w+)\}/$vars{$1}/eg;
	print;
}
