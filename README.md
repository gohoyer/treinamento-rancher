# treinamento-rancher

Este projeto cria um ambiente de laboratorio do [k3s](https://k3s.io) com um Master (server) e 2 Workers (agents), cada um com o SO  Ubuntu 20.04 com 2 CPU`s e 1G de memoria.

| Nome | IP |
| ---- | -- |
| master-1 | 192.168.56.11 |
| worker-1 | 192.168.56.21 |
| worker-2 | 192.168.56.22 |

> Caso deseje alterar a quantidade de CPU/Memoria de cada maquina altere o arquivo config.yaml

## Requisitos
[Instale o Vagrant](https://www.vagrantup.com/docs/installation) na sua estacao de trabalho.
## Utilizacao
Para inicializar o ambiente, digite os comandos a seguir:
```shell
git clone https://github.com/gohoyer/treinamento-rancher.git
cd treinamento-rancher
vagrant up
```

Apos o Vagrant terminar de inicializar e configurar as maquinas, verifique a saude do cluster.
```shell
vagrant ssh master-1
sudo su
k3s kubectl get nodes
```

>Resultado esperado:
>```shell
>NAME               STATUS   ROLES                  AGE     VERSION
>vagrant-worker-1   Ready    <none>                 5m19s   v1.23.6+k3s1
>vagrant-master-1   Ready    control-plane,master   9m48s   v1.23.6+k3s1
>vagrant-worker-2   Ready    <none>                 14s     v1.23.6+k3s1
>```

## Comandos basicos  do vagrant
> Atenção: Os comandos devem ser executados no diretorio que contem o Vagrantfile.

| Comando | Descricao |
| ------- | --------- |
| vagrant up | Inicializa e configura todas as maquinas |
| vagrant up <nome_da_maquina> | Inicializa e configura apenas a maquina especifiada |
| vagrant status | Mostra o status das maquinas |
| vagrant ssh <nome_da_maquina> | Estabelece uma conexao SSH com a maquina especifiada |
| vagrant destroy | Para e deleta todas as maquinas | 
| vagrant destroy <nome_da_maquina> | Para e deleta apenas a maquina especifiada |
| vagrant status | Mostra o status das maquinas |

Para obter a relacao  completa de comandos do vagrant digite `vagrant --help`.

Este lab foi testado e validado com o Vagrant 2.2.19.