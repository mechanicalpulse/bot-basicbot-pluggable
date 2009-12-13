use strict;
use warnings;
use File::Spec;
use Test::More;
use Try::Tiny;

if ( not $ENV{TEST_AUTHOR} ) {
    my $msg = 'Author test.  Set $ENV{TEST_AUTHOR} to a true value to run.';
    plan( skip_all => $msg );
}

try {
    require Test::Perl::Critic;
}
catch {
    my $msg = 'Test::Perl::Critic required to criticise code';
    plan( skip_all => $msg );
};

my $rcfile = File::Spec->catfile( 't', 'perlcriticrc' );
Test::Perl::Critic->import( -profile => $rcfile );
all_critic_ok();
