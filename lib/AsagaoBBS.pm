package AsagaoBBS;

use Asagao::Base;
use AsagaoBBS::Model::Comment;
use Data::Model::Driver::DBI;

my $dm = AsagaoBBS::Model::Comment->new;

{
    my $driver = Data::Model::Driver::DBI->new( dsn => 'dbi:SQLite:dbname=comments.db' );
    $dm->set_base_driver($driver);
}

get '/' => sub {
    my $self = shift;
    my @comments = $dm->get( comment => { order => { timestamp => 'ASC' } } );
    $self->mt( ':index', { comments => \@comments } );
};

post '/comment' => sub {
    my $self = shift;
    my %params;
    foreach my $key (qw(name title message)) {
        my $value = $self->req->param($key);
        utf8::decode($value);
        $params{$key} = $value;
    }
    $dm->set( comment => { %params, timestamp => time(), } );
    #   $self->redirect('/');
    $self->res->redirect('/');
};

__ASAGAO__
