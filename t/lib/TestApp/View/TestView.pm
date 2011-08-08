package TestApp::View::TestView;
use Moose;

extends qw( Catalyst::View );

sub process {
    my( $self, $c ) = @_;
    warn("HERE");
    $c->res->body( 'View' );
}

1;
