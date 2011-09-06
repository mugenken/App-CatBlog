package App::CatBlog::Controller::Account;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller::HTML::FormFu'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched App::CatBlog::Controller::Account in Account.');
}

sub login :Global Args(0) FormConfig {
    use Data::Dumper;
    my ( $self, $c ) = @_;

    my $form = $c->stash->{form};

    if ($form->submitted_and_valid){
        my $params = $form->params;
        if ($c->authenticate(
            {
                username => $params->{username},
                password => $params->{password},
            },
            'local',
        )){
            $c->res->redirect( $c->uri_for('/') );
        }
        else {
            $c->res->body( 'fail' );
        }
    }
}

sub register :Global Args(0) FormConfig {
    use Data::Dumper;
    my ( $self, $c ) = @_;

    my $form = $c->stash->{form};

    if ($form->submitted_and_valid){
        my $params = $form->params;
        delete $params->{password_check};
        delete $params->{submit};
        $c->model('CatBlogDB')
            ->resultset('Account')
            ->create( $params );

        $c->res->redirect( $c->uri_for('/'));
    }
}

1;
