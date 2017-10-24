package Ra::Controller::Rejectlist;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub incluir {
    my $self = shift;

    my $lista = $self->param('lista');
    $self->stash(lista => $lista);
    $self->render;
}

1;
