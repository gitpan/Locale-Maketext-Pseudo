use Test::More tests => 6;

BEGIN {
use_ok( 'Locale::Maketext::Pseudo' );
}

diag( "Testing Locale::Maketext::Pseudo $Locale::Maketext::Pseudo::VERSION methods" );

my $fake = Locale::Maketext::Pseudo->new();
ok( ref $fake eq 'Locale::Maketext::Pseudo', 'new() object');

ok(
    $fake->maketext('Hello [1], I am [2]', 'World', 'Dan')  eq 'Hello World, I am Dan', 
    'maketext() interpolation in order'
);

ok(
    $fake->maketext('[2]: Hello [1], I am [2]', 'World', 'Dan')  eq 'Dan: Hello World, I am Dan', 
    'maketext() interpolation in order - multi'
);

ok(
    $fake->maketext('Hello [2], I am [1]', 'World', 'Dan')  eq 'Hello Dan, I am World', 
    'maketext() interpolation out of order'
);

ok(
    $fake->maketext('[1]: Hello [2], I am [1]', 'World', 'Dan')  eq 'World: Hello Dan, I am World', 
    'maketext() interpolation out of order - multi'
);