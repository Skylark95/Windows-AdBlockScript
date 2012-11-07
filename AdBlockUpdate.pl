use strict;
use warnings;
use LWP::Simple;

# Files
my $urlFile = "updateURLs.txt";
my $hostsFile = "C:/Windows/System32/drivers/etc/hosts";

# Load URLs
my @urls;
my $count = 0;
open(my $in, "<", $urlFile) or die "Can't open urlFile.";

while (<$in>) {
	$urls[$count++] = $_;
}

close $in;

# Confirm update
print "Path to hosts file:\n";
print "$hostsFile\n\n";
print "Host URLs in $urlFile:\n";
print @urls;
print "\n\n";
print "Would you like to update your hosts file with the above URLs? (Y/N): ";
my $response = <>;

# Read URLs and output to file
if ($response =~ /^[Y|y]$/) {	
	print "Updating... ";
	open (my $out, ">", $hostsFile) or die "Can't open hostsFile";
	
	foreach(@urls) {
		my $content = get($_);
		
		foreach(split /\n/, $content) {
			
			if (/^#/ || /^127\.0\.0\.1/) {
				print $out $_;
			}
			
		}
	}
	close $out;
	print "Done\n\nYou will need to restart your computer for changes to take effect...";
	
} else {
	print "Canceled...";
}

print "\n\nPress Enter to Exit.";
<>;

