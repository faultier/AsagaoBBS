package AsagaoBBS::Model::Comment;
use strict;
use warnings;
use base 'Data::Model';
use Data::Model::Schema;
use Time::Piece;
use Text::MicroTemplate;

install_model comment => schema {
    key 'id';
    column id => int => +{
        required       => 1,
        unsigned       => 1,
        auto_increment => 1,
    };
    utf8_column name => varchar => +{
        required => 1,
        size     => 255,
    };
    utf8_column title => varchar => +{
        required => 1,
        size     => 255,
    };
    utf8_column message => varchar => +{
        required => 1,
        size     => 2048,
    };
    column timestamp => int => +{
        required => 1,
        unsigned => 1,
    };
    add_method date => sub {
        my $self = shift;
        my $t    = localtime( $self->timestamp );
        $t->strftime('%Y-%m-%d %H:%M:%S');
    };
};

1;
