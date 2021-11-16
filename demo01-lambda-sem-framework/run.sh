# 1° Passo: - criar arquivo de politicas de segurança
# 2° Passo: - criar role de segurança na AWS (IAM)

aws iam create-role \
   --role-name lambda-exemplo \
   --assume-role-policy-document file://politicas.json \
   | tee logs/role.log

# 3° Passo: criar arquivo com conteudo e zipa-lo
zip function index.js

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::991899794548:role/lambda-exemplo
    | tee logs/lambda-create.log

# 4° Passo: invocar a lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# 5° Passo: Atualizar e zipar
zip function index.js

# 6° Passo: Atualizar lambda
aws lambda update-function-code \
    --zip-file fileb://index.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# 7° Passo: invocar a lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# 8° Passo: removendo
aws lamnda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name lambda-exemplo