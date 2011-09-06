package App::CatBlog::Schema::CatBlogDB;

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;

sub create_initial_date {
    my $self = shift;

    return;
}

1;
