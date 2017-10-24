package Ra;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('index#index');
  $r->get('/dev')->to('index#index_dev');
  $r->get('/json')->to('index#index_json');
  
  #Seguranca
  $r->get('/seguranca/verip/')->to('seguranca#verip_index');
  $r->post('/seguranca/verip/buscar/')->to('seguranca#verip_buscarip');
  $r->post('/seguranca/verip/liberarip/')->to('seguranca#verip_liberar');
  $r->post('/seguranca/verip/teste/')->to('seguranca#verip_teste');

  $r->get('/seguranca/rejectlist/')->to('seguranca#rejectlist_index');
  $r->post('/seguranca/rejectlist/teste')->to('seguranca#rejectlist_teste');
  $r->post('/seguranca/rejectlist/incluir')->to('seguranca#rejectlist_incluir');
  
  $r->post('/incluirreject/')->to('rejectlist#incluir');

  #Servidores
  $r->get('/servidores/mailqueue/')->to('servidores#mailqueue');
  $r->get('/servidores/diskused/')->to('servidores#diskused');
  $r->get('/servidores/listar/')->to('servidores#list_index');
}

1;
