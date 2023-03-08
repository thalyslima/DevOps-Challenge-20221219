# DevOps Challenge 20221219
---

## Como criar um site estático utilizando AWS S3 ou Azure Storage, através do Terraform.

## Como instalar e utilizar o projeto
---
1. 
2. 
3. 
4. 
5. 
Acessar uma das pastas: cd terraform-aws ou cd terraform-azure
Rodar o comando para inicializar o terraform: terraform init
Rodar o comando terraform plan e verificar os recursos (deverão aparecer 18 recursos para adicionar)
Verificar os arquviso no provedor de cloud escolhido
Acessar a url e testar a calculadora:
AWS -> acessar o bucket -> propriedades -> rolar para o final da página até Static website hosting e acessar Bucket website endpoint
Azure -> acessar o grupo de recursos -> ir no storage criado -> no item Data management, clicar em Static website e abrir o endpoint

## Fluxo do projeto
---

## Parte 1 - Build
---
1. Inicializado projeto devops-challenge-20221219
2. Adicionado o projeto calculator como submodule
3. Alterações salvas e adicionadas no repositório do GitHub
4. Rodado comando para instalar npm
5. Teste local com npm start e criado a pasta build em seguida

## Parte 2 - Deploy
---
1. Criado arquivo main.tf para configurar as instruções do terraform
2. Configure aws credentials file
3. 

