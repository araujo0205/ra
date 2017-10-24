package Ra::Controller::Index;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
  my $self = shift;
  my @servers = [
  				'teste2',
  				'h01', 'h05', 'h10', #HM Hosp
  				'r01', 'r05', 'r10', 'r15h', 'r20h' #HM Rev
  				 ];

  $self->stash(servers => @servers);

  $self->render;
}

sub index_dev {
    my $self = shift;


    use JSON::PP;

    my $filename = '/home/david/Documentos/ra/public/json/servers.json';
    open(my $sf, '<:encoding(UTF-8)', $filename)
      or die "Não foi possível abrir o arquivo '$filename' $!";
 
    my $serversJson = <$sf>;
    my $serversRef = decode_json $serversJson;
    my %servers = %$serversRef;

    $self->stash(servers => \%servers);
    
    $self->render;
}

sub index_json {
    my $self = shift;

    use JSON::PP;

    my $draw = $self->param('draw');
    my $json = '{"draw":'. $draw . ',"recordsTotal":37,"recordsFiltered":37,"data":[["Airi","Satou","Accountant","Tokyo","28th Nov 08","$162,700"],["Angelica","Ramos","Chief Executive Officer (CEO)","London","9th Oct 09","$1,200,000"],["Ashton","Cox","Junior Technical Author","San Francisco","12th Jan 09","$86,000"],["Bradley","Greer","Software Engineer","London","13th Oct 12","$132,000"],["Brenden","Wagner","Software Engineer","San Francisco","7th Jun 11","$206,850"],["Brielle","Williamson","Integration Specialist","New York","2nd Dec 12","$372,000"],["Bruno","Nash","Software Engineer","London","3rd May 11","$163,500"],["Caesar","Vance","Pre-Sales Support","New York","12th Dec 11","$106,450"],["Cara","Stevens","Sales Assistant","New York","6th Dec 11","$145,600"],["Cedric","Kelly","Senior Javascript Developer","Edinburgh","29th Mar 12","$433,060"]]}';

    my $perl_scalar = decode_json $json;


    
    $self->render(json => \%$perl_scalar);
}

1;
