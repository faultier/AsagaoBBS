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
    $self->render( ':index', { comments => \@comments } );
};

post '/comment' => sub {
    my $self = shift;
    my %params;
    $dm->set(
        comment => {
            name      => $self->param('name'),
            title     => $self->param('title'),
            message   => $self->param('message'),
            timestamp => time(),
        }
    );
    $self->redirect('/');
};

__ASAGAO__
