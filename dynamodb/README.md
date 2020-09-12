The following starts up local dynamodb using localstack, via docker:
```
docker-compose up
```

The status of localstack can be checked by:
```
curl localhost:4566/health
```

# AWS CLI

It is necessary to have some aws config setup to run further commands. Localstack requires aws config and credentials to be set, but ignores the access keys.


```
aws --endpoint-url http://localhost:4566 dynamodb create-table --cli-input-json file://example-table.json
aws --endpoint-url http://localhost:4566 dynamodb list-tables
aws --endpoint-url http://localhost:4566 dynamodb put-item --table-name exampleDynamoTable --item file://example-item.json
aws --endpoint-url http://localhost:4566 dynamodb scan --table-name exampleDynamoTable
```

# Terraform

```
terraform init
terraform apply
```


# Node Example

```
yarn 
node index.js
aws --endpoint-url http://localhost:4566 dynamodb scan --table-name exampleDynamoTable
aws --endpoint-url http://localhost:4566 dynamodb scan --table-name device-stats
```
