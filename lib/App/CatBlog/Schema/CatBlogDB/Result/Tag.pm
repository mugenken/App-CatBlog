package App::CatBlog::Schema::CatBlogDB::Result::Tag;

use strict;
use warnings;

=head1 NAME

App::CatBlog::Schema::CatBlogDB::Tag - a schema class representing a tag (or "label" or
"keyword").

=head1 SYNOPSIS
      
    my $schema = App::CatBlog->model("BlogDB");

    my $tags_rs = $schema->resultset('Tag');

    my $cats_tag = $posts_rs->find_or_create({
        label => "cats"
        });

    my $perl_tag = $posts_rs->find_or_create({
        label => "perl"
        });

=head1 DESCRIPTION

This is the tag schema class for L<App::CatBlog>.

=head1 FIELDS

This field list also comprises a method list, since DBIC
creates accessor methods for each field.

=head2 id

Auto-incremented post ID.

=head2 label

Each tag can have a label up to 80 characters.

=head1 METHODS

=cut

use base qw( DBIx::Class );

__PACKAGE__->load_components( qw( Core ) );
__PACKAGE__->table( 'tag' );
__PACKAGE__->add_columns(
    id => {
        data_type         => 'bigint',
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    label => {
        data_type => 'varchar',
        size => 80,
        is_nullable => 0,
    },
);

__PACKAGE__->set_primary_key( qw( id ) );
__PACKAGE__->resultset_attributes( { order_by => [ 'label' ] } );
__PACKAGE__->add_unique_constraint( [ 'label' ] );
__PACKAGE__->has_many(
    posts_assoc => 'App::CatBlog::Schema::CatBlogDB::Result::PostTagAssoc',
    'tag_id',
);
__PACKAGE__->many_to_many(
    posts   => 'posts_assoc', 
    'post'
);

=head1 SEE ALSO

L<App::CatBlog::Schema::CatBlogDB>, L<App::CatBlog>, L<DBIx::Class>

L<App::CatBlog::Schema::CatBlogDB::Post>

=head1 AUTHOR

Shlomi Fish L<http://www.shlomifish.org/> .

=head1 LICENSE

This module is free software, available under the MIT X11 Licence:

L<http://www.opensource.org/licenses/mit-license.php>

Copyright by Shlomi Fish, 2009.

=cut

1;
