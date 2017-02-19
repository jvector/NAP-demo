use strict;
use warnings;

use MyWardrobe;

my $app = MyWardrobe->apply_default_middlewares(MyWardrobe->psgi_app);
$app;

