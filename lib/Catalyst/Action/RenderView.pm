package Catalyst::Action::RenderView;

our $VERSION='0.01';

use base 'Catalyst::Action';

sub execute {
    my $self = shift;
    my ($controller, $c ) = @_;
    $self->NEXT::execute( @_ );
    die "forced debug" if $c->debug && $c->req->params->{dump_info};
    if(! $c->response->content_type ) {
        $c->response->content_type( 'text/html; charset=utf-8' );
    return 1 if $c->req->method eq 'HEAD';
    return 1 if length( $c->response->body );
    return 1 if scalar @{ $c->error } && !$c->stash->{template};
    return 1 if $c->response->status =~ /^(?:204|3\d\d)$/;
    }
    my $view=$c->view() 
        || die "Catalyst::Action::RenderView could not find a view to forward to.\n";
    $c->forward( $view );
};
 
1;

=head1 NAME

Catalyst::Action::RenderView - Sensible default end action.

=head1 SYNOPSIS

    sub end : ActionClass('RenderView') {}

=head1 DESCRIPTION

This action implements a sensible default end action, which will forward
to the first available view, unless status is set to 3xx, or there is a
response body. It also allows you to pass dump_info=1 to the url in order
to force a debug screen, while in debug mode.

If you have more than 1 view, you can specify which one to use with the
'default_view' config setting (See view in L<Catalyst>.)

=head1 METHODS

=over 4

=item end

The default end action, you can override this as required in your application
class, normal inheritance applies.

=cut


=back

=head1 AUTHOR

Marcus Ramberg <marcus@thefeed.no>

=head1 LICENSE

This library is free software . You can redistribute it and/or modify it under
the same terms as perl itself.

=cut

