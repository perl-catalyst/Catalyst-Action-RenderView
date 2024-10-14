# NAME

Catalyst::Action::RenderView - Sensible default end action.

# SYNOPSIS

```perl
sub end : ActionClass('RenderView') {}
```

# DESCRIPTION

This action implements a sensible default end action, which will forward
to the first available view, unless `$c->res->status` is a 3xx code
(redirection, not modified, etc.), 204 (no content), or `$c->res->body` has
already been set. It also allows you to pass `dump_info=1` to the url in
order to force a debug screen, while in debug mode.

If you have more than one view, you can specify which one to use with
the `default_view` config setting and the `current_view` and
`current_view_instance` stash keys (see [Catalyst](https://metacpan.org/pod/Catalyst)'s `$c->view($name)`
method -- this module simply calls `$c->view` with no argument).

# METHODS

## end

The default `end` action. You can override this as required in your
application class; normal inheritance applies.

# INTERNAL METHODS

## execute

Dispatches control to superclasses, then forwards to the default View.

See ["METHODS/action" in Catalyst::Action](https://metacpan.org/pod/Catalyst%3A%3AAction#METHODS-action).

# SCRUBBING OUTPUT

When you force debug with dump\_info=1, RenderView is capable of removing
classes from the objects in your stash. By default it will replace any
DBIx::Class ResultSource objects with the class name, which cleans up the
debug output considerably, but you can change what gets scrubbed by
setting a list of classes in
$c->config->{'Action::RenderView'}->{ignore\_classes}.
For instance:

```
$c->config->{'Action::RenderView'}->{ignore_classes} = [];
```

To disable the functionality. You can also set
config->{'Action::RenderView'}->{scrubber\_func} to change what it does with the
classes. For instance, this will undef it instead of putting in the
class name:

```perl
$c->config->{'Action::RenderView'}->{scrubber_func} = sub { undef $_ };
```

## Deprecation notice

This plugin used to be configured by setting `$c->config->{debug}`.
That configuration key is still supported in this release, but is
deprecated, please use the ` 'Action::RenderView' ` namespace as shown
above for configuration in new code.

# EXTENDING

To add something to an `end` action that is called before rendering,
simply place it in the `end` method:

```perl
sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;
    # do stuff here; the RenderView action is called afterwards
}
```

To add things to an `end` action that are called _after_ rendering,
you can set it up like this:

```perl
sub render : ActionClass('RenderView') { }

sub end : Private {
    my ( $self, $c ) = @_;
    $c->forward('render');
    # do stuff here
}
```

# AUTHORS

- Marcus Ramberg <marcus@thefeed.no>
- Florian Ragwitz <rafl@debian.org>

# CONTRIBUTOR

Graham Knop <haarg@haarg.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2006 - 2009 by Marcus Ramberg and Florian Ragwitz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
