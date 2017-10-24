package Ra::Controller::Verip;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
  my $self = shift;

  my $ip = $self->param('ip');
  my $servers = $self->param('servers');
  $self->stash(ip => $ip, server => $servers);
  $self->render;
}

sub liberar {
  my $self = shift;

  my $ip = $self->param('ip');
  my $server = $self->param('server');
  my $type = $self->param('type');
  $self->stash(ip => $ip, server => $server, type => $type);
  $self->render;
}

1;
