package Elastoman::Communicator;

use JSON;

my $host = 'localhost';
my $port = 9200;

sub set_server {
	$host = shift;
	$port = shift;
}

sub search {
	my ($index, $type, $query, $params) =  @_;

	my $uri = 'http://' . $host . ':' . $port . '/';
	$uri .= defined $index ? $index . '/' : '_all/';
	$uri .= $type . '/' if defined $type;
	$uri .= '_search';

	if (defined $params) {
		$uri .= '?';
		foreach (keys %{$params}) {
			$uri .= $_ . '=' . $params->{$_} . '&';
		}
	}

	$query = encode_json($query) if ref $query eq 'HASH'; # encode json query

	my $req = "curl -s -XGET $uri -d \'$query\'";
	print $req, "\n";
	my $res = `$req`;

	return decode_json($res);
}

__END__

=head1 NAME

Elastoman Communicator

=head1 SYNOPSIS

=head1 DESCRIPTION

A library of functions for sending requests and receiving responses. At the moment
of this writing this was done using command line curl but in the future it might
use the excelent ElasticSearch.pm and an underline transport layer such as Curl.

=head1 FUNCTIONS

=head2 send (index, type, method, query, params)

Receives an index name, which can be a string such as 'index1,index2'.
The type is the document type, can be '_all' or undef

=head1 AUTHOR

J.B. Ribeiro, E<lt>vredens@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by J.B. Ribeiro

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.3 or,
at your option, any later version of Perl 5 you may have available.

=cut
