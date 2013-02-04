#/usr/bin/perl

use strict;
use Getopt::Long;
use File::Temp;

my $cmd;

#debug
my $debug = 0;

#parameters
my $probe_name;
my $output;

#
Getopt::Long::Configure ("pass_through");
my $result = GetOptions(
	   'output=s' => \$output,
	   'name=s' => \$probe_name, 
	   );

#run next rnai script with temp folder
my $tmp_output = $output."_results";
if (-e $tmp_output){
	if( unlink($tmp_output) != 0){
		die "Error, tmp output directory exists and cannot be deleted";
	}
}
$cmd = "perl /software/bin/nextrnai.pl @ARGV -n $probe_name --output $tmp_output >/home/galaxy/galaxy_dist/logs/nextrnai.log 2>/home/galaxy/galaxy_dist/logs/nextrnai.err";
#print $output,"\n";
print $cmd,"\n" if $debug;
system($cmd);

#copy the tar.gz file and replace the output file with it
$cmd = "cp ".$tmp_output."/".$probe_name.".tar.gz"." $output";

print $cmd,"\n" if $debug;
system($cmd);

#clean up the temp file
if( -e $tmp_output){
	$cmd = "rm -r $tmp_output";
	print $cmd,"\n" if $debug;
	system($cmd);
}


print "PLEASE DOWNLOAD THE RESULTS!\n";
exit;
