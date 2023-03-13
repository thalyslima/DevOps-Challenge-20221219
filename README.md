# DevOps Challenge 20221219

## Como criar um site estático utilizando AWS S3 ou Azure Storage, através do Terraform.

## Fluxo do projeto

### Parte 1 - Build
1. Inicializado projeto devops-challenge-20221219
2. Adicionado o projeto calculator como submodule
3. Alterações salvas e adicionadas no repositório do GitHub
4. Rodado comando para instalar npm
5. Teste local com npm start e criado a pasta build em seguida

### Parte 2 - Deploy
1. Criado arquivo main.tf e adicionado as instruções do terraform
2. Configurado as credentials da AWS, através da chave gerada no console 
3. Configurado azure cli, para realizar login localmente
4. Realizado configurações necessárias para subir o projeto
5. Iniciado projeto com terraform e realizado deploy nos provedores

### Como instalar e utilizar o projeto
1. Para clonar repositório com o conteúdo do submodule, utilizar o comando: git clone --recursive url
2. Acessar a pasta do projeto: cd calculator
3. Rodar o comando para instalar o npm: npm install
4. Adicionar versão compatível do node, rodando o comando nvm install 16.8.0 e depois nvm use 16.8.0
5. Rodar o comando para testar o projeto localmente: npm start
6. Depois de testado local, rodar o comando para gerar a pasta build: npm run build
7. Editar o arquivo build/index.html, retirando o path /calculator/ de todas os caminhos
8. Para AWS -> cd terraform-aws -> configurar as credenciais localmente -> alterar o caminho do arquivo credentials na linha 12 do main.tf
9. Para Azure -> cd terraform-azure -> az login --tenant
10. Rodar o comando para inicializar o terraform: terraform init
11. Rodar o comando terraform plan e verificar os itens a serem adicionados
12. Acessar a url e testar a calculadora:
AWS -> acessar o bucket -> propriedades -> rolar para o final da página até Static website hosting e acessar Bucket website endpoint
Azure -> acessar o grupo de recursos -> ir no storage criado -> no item Data management, clicar em Static website e abrir o endpoint
13. Para deletar os recursos, rodar o comando terraform destroy em cada ambiente