package App::CatBlog::Controller::Account;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller::HTML::FormFu'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched App::CatBlog::Controller::Account in Account.');
}

sub register :Global Args(0) FormConfig {
    use Data::Dumper;
    my ( $self, $c ) = @_;

    my $form = $c->stash->{form};

    if ($form->submitted_and_valid){
        my $params = $form->params;
        $c->model('CatBlogDB')
            ->resultset('Account')
            ->create( $params );

        $c->res->redirect( $c->uri_for('/'));
    }
}

1;
