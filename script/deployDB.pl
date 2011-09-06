#!/usr/bin/perl

use strict;
use warnings;
use lib 'lib';

require App::CatBlog;
App::CatBlog->model('CatBlogDB')->schema->deploy;

