package Ra::Controller::Seguranca;
use Mojo::Base 'Mojolicious::Controller';

sub verip_index {
    my $self = shift;

    use JSON::PP;
    use Mojo::Home;

    my $home = Mojo::Home->new;

    my $filename = $home->rel_file('../public/json/servers.json');
    open(my $sf, '<:encoding(UTF-8)', $filename)
      or die "Não foi possível abrir o arquivo '$filename' $!";
 
    my $serversJson = <$sf>;
    my $serversRef = decode_json $serversJson;
    my %servers = %$serversRef;

    $self->stash(servers => \%servers);

    $self->render;
}
sub verip_buscarip {
  my $self = shift;

  my $ip = $self->param('ip');
  my $servers = $self->param('servers');
  $self->stash(ip => $ip, server => $servers);
  $self->render;
}
sub verip_liberar {
  my $self = shift;

  my $ip = $self->param('ip');
  my $server = $self->param('server');
  my $type = $self->param('type');
  $self->stash(ip => $ip, server => $server, type => $type);
  $self->render;
}

sub rejectlist_index {
    my $self = shift;
    $self->render;
}

sub rejectlist_incluir {
    my $self = shift;

    my $lista = $self->param('lista');
    $self->stash(lista => $lista);
    $self->render;
}
1;
