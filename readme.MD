# Ra 

Sistema que auxilia no monitoramento dos servidores com uma fácil visualização do mailqueue e uso de disco, há também uma opção de liberar o IP caso utilize o csf nos servidores.

## Instalação
OBS: é necessário que todos os servidores estejam configurados com a chave no ssh.

### Passo 1: ListServers.pl
O primeiro procedimento necessário é listar os servidores, é possível agrupá-los (ex: servidores_eua, servidores_brasil):
```
my %servers1 = (

    server1 => '1.1.1.1',
    server2 => '2.2.2.2'
);
```

Após para facilitar o carregamento de todos os servidores há um hash agrupado:
```
my %total_servers = (%servers1,...,%serversn);
```

Por último, neste arquivo basta escolher o nome do arquivo que será salvo:
```
open($sf, '>', $RealBin . '/../public/json/servers_1.json');
$json_text = encode_json \%servers1;
print $sf $json_text;
close $sf;
```
Atualmente estão sendo salvos dentro da pasta *public/json*

### Passo 2: UpDiskUsed.pl e UpInfoMQueue.pl
Para cada grupo criado no ListServes.pl é necessário executar a função `UpDiskUsed()`:

```
UpDiskUsed('nome_arquivo_servidor.json','diskused_nome_arquivo_servidor.json');
```

o mesmo vale para o arquivo UpInfoMQueue.pl só mudará o nome da função, que será `UpInfoMQueue()`:

```
UpInfoMQueue('nome_arquivo_servidor.json','diskused_nome_arquivo_servidor.json'); 
```

### Passo 3: Alterando o layout
Para cada grupo há um gráfico de uso: mailqueue e espaço em disco; o nome pode variar como desejar

```
<div class="col-md-6 col-sm-6 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
            <h2>Servidores 1</h2>
            <ul class="nav navbar-right panel_toolbox">
	        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> </li>
            </ul>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
             <canvas id="servers_1_chart"></canvas>
         </div>
     </div>
</div>
```
Basicamente, basta alterar o id do canvas na linha `<canvas id="servers_1_chart"></canvas>`.

A atualização é efetuada através de ajax. Pode criar quantos forem necessários abaixo um exemplo que está no arquivo:

```
jQuery.getJSON("/json/mailqueue_servers_1.json", function(data) {
      var ctx = document.getElementById("servers_1_chart");
      var mybarChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: data.servidores,
          datasets: [{
            label: 'e-mails',
            backgroundColor: "#e67300",
            data: data.valores
          }]
        },

        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });

});
```

As alterações principais é o primeiro parâmetro da função `getJSON` e o valor da função `document.getElementById()`

