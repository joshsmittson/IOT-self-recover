#!/usr/bin/perl

# Usage   ./send2syslog.pl   <ip | hostname>  "Message to log to remote syslog"

use IO::Socket;
use strict;
my $ip = $ARGV[0];
my $msg = $ARGV[1];

my $sock = IO::Socket::INET->new(
    Proto    => 'udp',
    PeerPort => 514,
    PeerAddr => "$ip",
) or die "Could not create socket: $!\n";

$sock->send("<14>$msg") or die "Send error: $!\n";
exit (0);
