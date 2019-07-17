#!/usr/bin/perl
use Socket;
# lxc07 ansible_host=10.19.143.160 dnat_ip=10.19.15.160 sec_ip=10.19.64.72 vmid=106

my $hostname_start="lxc";
my $hostname_start_number=7;
my $vmid_start=106;
my $omc_start="10.19.143.160";
my $dnat_start="10.19.15.160";
my $sec_start="10.19.64.72";

my $hostname_number="";
my $vmid=$vmid_start;

sub addrtoint { return( unpack( "N", pack( "C4", split( /[.]/,$_[0] ) ) ) ) };
sub inttoaddr { return( join( ".", unpack( "C4", pack( "N", $_[0] ) ) ) ) };

my $omc_ipaddr=addrtoint($omc_start);
my $dnat_ipaddr=addrtoint($dnat_start);
my $sec_ipaddr=addrtoint($sec_start);
#print unpack('N', $omc_ipaddr), "\n";

for (my $i=$hostname_start_number; $i <= 16; $i++) {
  if ($i < 10) { $hostname_number  = "0".$i; }
  else { $hostname_number  = $i; }
  my $host_str = $hostname_start.$hostname_number;
  my $omc_str = inttoaddr $omc_ipaddr;  
  my $dnat_str = inttoaddr $dnat_ipaddr;  
  my $sec_str = inttoaddr $sec_ipaddr;  
  my $inventory_str = $host_str." ansible_host=".$omc_str." dnat_ip=".$dnat_str." sec_ip=".$sec_str." vmid=".$vmid;
  print "$inventory_str\n";
  $vmid++;
  $omc_ipaddr--;
  $dnat_ipaddr--;
  $sec_ipaddr++;
}
