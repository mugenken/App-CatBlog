use strict;
use warnings;

use App::CatBlog;

my $app = App::CatBlog->apply_default_middlewares(App::CatBlog->psgi_app);
$app;

