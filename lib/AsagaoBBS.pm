package AsagaoBBS;

use Asagao::Base;

get '/' => sub {
    my $self = shift;
    $self->mt( ':index', { comments => [] } );
};

__ASAGAO__
