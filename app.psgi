BEGIN {
    use Data::Model::Driver::DBI;
    use AsagaoBBS::Model::Comment;
    my $table_exists = -e './comments.db';
    my $dm           = AsagaoBBS::Model::Comment->new;
    my $driver       = Data::Model::Driver::DBI->new( dsn => 'dbi:SQLite:dbname=comments.db' );
    $dm->set_base_driver($driver);
    unless ($table_exists) {
        foreach my $target ( $dm->schema_names ) {
            my $dbh = $dm->get_driver($target)->rw_handle;
            foreach my $sql ( $dm->as_sqls($target) ) {
                $dbh->do($sql);
            }
        }
    }
}

use AsagaoBBS;
AsagaoBBS::set views  => [qw(views)];
AsagaoBBS::set static => 'public';

AsagaoBBS->psgi_app;

# vim: ft=perl enc=utf-8
