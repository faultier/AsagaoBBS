use AsagaoBBS;

AsagaoBBS::set views  => [qw(views)];
AsagaoBBS::set static => 'public';

AsagaoBBS->psgi_app;

# vim: ft=perl enc=utf-8
