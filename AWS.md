# Comandos AWS para configuracao

aws configure

# Comando para listar todos os arquivos dentro do bucket S3

aws s3 ls nome_do_bucket

# Comando Linux para criar um arquivo e passar um conteudo pra dentro dele

echo "Hello world" > file-test.txt

# Comando para fazer upload do arquivo criado para o bucket S3

aws s3 cp file-test.txt s3://nome_do_bucket

# Comando para criar uma role via terminal

aws iam create-role --role-name Test-Role --assume-role-policy-document file://politicas.json | tee logs/role.log

# Comando para criação da role

aws iam create-role --role-name lambda-exemplo --assume-role-policy-document file://politicas.json | tee logs/role.log

# Comando para criação da lambda function

aws lambda create-function --function-name hello-cli --zip-file fileb://index.zip --handler index.handler --runtime nodejs12.x --role arn:aws:iam::991899794548:role/lambda-exemplo | tee logs/lambda-create.log
aws lambda invoke --function-name hello-cli --log-type Tail logs/lambda-exec.log

# Comando para atualização da lambda function

aws lambda update-function-code --zip-file fileb://index.zip --function-name hello-cli --publish | tee logs/lambda-update.log
aws lambda invoke --function-name hello-cli --log-type Tail logs/lambda-exec-update.log

# Comando para deletar a lambda function e a role

aws lambda delete-function --function-name hello-cli
aws iam delete-role --role-name lambda-exemplo
