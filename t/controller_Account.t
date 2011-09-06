use strict;
use warnings;
use Test::More;


use Catalyst::Test 'App::CatBlog';
use App::CatBlog::Controller::Account;

ok( request('/account')->is_success, 'Request should succeed' );
done_testing();
