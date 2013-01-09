package CLI::Display;

use 5.012003;
use strict;
use warnings;

use Term::ANSIColor;
use Carp;

require Exporter;

our @ISA = qw(Exporter);

our @EXPORT_OK = ( qw(print_error print_ok print_hl print_die) );

our @EXPORT = qw();

sub print_error {
	print color 'red';
	print @_;
	print color 'reset';
}

sub print_die {
	print_error (@_) and croak 'Died';
}

sub print_ok {
	print color 'green';
	print @_;
	print color 'reset';
}

sub print_hl {
	print color 'yellow';
	print @_;
	print color 'reset';
}

1;

__END__

=head1 NAME

Command Line Interface Display Helpers

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SEE ALSO


=head1 AUTHOR

J.B. Ribeiro, E<lt>vredens@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by J.B. Ribeiro

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.3 or,
at your option, any later version of Perl 5 you may have available.

=cut
