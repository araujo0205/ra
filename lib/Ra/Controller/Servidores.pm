package Ra::Controller::Servidores;
use Mojo::Base 'Mojolicious::Controller';

sub list_index {
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
1;
