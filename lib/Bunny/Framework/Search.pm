 #!/usr/bin/perl

#########################################################
# Bunny developed by Heitor Gouvêa                      #
# This work is licensed under MIT License               #
# Copyright (c) 2016 Heitor Gouvea                      #
#                                                       #
# [+] AUTOR:        Heitor Gouvêa                       #
# [+] EMAIL:        hi@heitorgouvea.me                  #
# [+] GITHUB:       https://github.com/GouveaHeitor     #
# [+] TWITTER:      https://twitter.com/GouveaHeitor    #
# [+] FACEBOOK:     https://fb.com/GouveaHeitor         #
#########################################################

package Bunny::Framework::Search;

use JSON;
use LWP::UserAgent;
use Bunny::Console;
use Bunny::Framework::Functions;

my $ua   = LWP::UserAgent -> new;
my $func = Bunny::Framework::Functions;
my $api  = "https://api.myjson.com/bins/4r2iv";

sub new {
	print "
	\rName                   Description
   	\r-----                  ------------\n";

	my $request = $ua -> get ($api);
	my $httpCode = $request -> code;

	if ($httpCode == "200") {
		my $data = decode_json ($request -> content);

		foreach my $elements (@$data) {

			my $name = $elements -> {'name'};
			my $desc = $elements -> {'desc'};

			if ($name =~ /$command[1]/ ) {
				print "$name \t $desc\n";
			}
		}
	}

	else {
		$func -> error();
	}

	Bunny::Console -> new();
}

1;