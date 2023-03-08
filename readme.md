# DevOps Challenge 20221219

## Como criar um site estático utilizando AWS S3 ou Azure Storage, através do Terraform.

## Como instalar e utilizar o projeto
1. Para clonar repositório com o conteúdo do submodule, utilizar o comando: git clone --recursive https://github.com/thalyslima/devops-challenge-20221219.git
2. 
3. 
4. 
5. 
6. Para AWS -> cd terraform-aws -> configurar credentials
7. Para Azure -> cd terraform-azure -> az login --tenant
8. Rodar o comando para inicializar o terraform: terraform init
9. Rodar o comando terraform plan e verificar os recursos (deverão aparecer 18 recursos para adicionar)
10 .Verificar os arquviso no provedor de cloud escolhido
11. Acessar a url e testar a calculadora:
12. AWS -> acessar o bucket -> propriedades -> rolar para o final da página até Static website hosting e acessar Bucket website endpoint
13. Azure -> acessar o grupo de recursos -> ir no storage criado -> no item Data management, clicar em Static website e abrir o endpoint

## Fluxo do projeto

### Parte 1 - Build
1. Inicializado projeto devops-challenge-20221219
2. Adicionado o projeto calculator como submodule
3. Alterações salvas e adicionadas no repositório do GitHub
4. Rodado comando para instalar npm
5. Teste local com npm start e criado a pasta build em seguida

### Parte 2 - Deploy
1. Criado arquivo main.tf para configurar as instruções do terraform
2. Configure aws credentials file
3. 

