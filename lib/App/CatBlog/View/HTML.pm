package App::CatBlog::View::HTML;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
    INCLUDE_PATH => [
        App::CatBlog->path_to( 'root', 'src' ),
        App::CatBlog->path_to( 'root', 'lib' )
    ],
    TEMPLATE_EXTENSION => '.tt2',
    PRE_PROCESS        => 'config/main.tt2',
    WRAPPER            => 'site/wrapper.tt2',
    ERROR              => 'error.tt2',
    TIMER              => 0,
    render_die         => 1,
});

=head1 NAME

App::CatBlog::View::HTML - Catalyst TTSite View

=head1 SYNOPSIS

See L<App::CatBlog>

=head1 DESCRIPTION

Catalyst TTSite View.

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

