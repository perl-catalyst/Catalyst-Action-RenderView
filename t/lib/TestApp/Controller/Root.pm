package TestApp::Controller::Root;
use strict;
use warnings;

use base qw/Catalyst::Controller/;

__PACKAGE__->config( namespace => '' );

sub test_view : Global {
    my( $self, $c ) = @_;
    $c->config->{ view } = 'TestApp::View::TestView';
    return 1;
}

sub test_firstview : Global {
    my( $self, $c ) = @_;
    delete $c->config->{ view };
    return 1;
}

sub test_skipview : Global {
    my( $self, $c ) = @_;
    $c->res->body( 'Skipped View' );
}

sub end : ActionClass('RenderView') {}

1;
