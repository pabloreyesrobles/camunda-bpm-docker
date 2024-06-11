#!/bin/bash
echo "Waiting for Camunda to be ready..."
until curl -s -o /dev/null http://localhost:8080/engine-rest/engine; do
  sleep 2
done

echo "Removing default demo user..."
curl -s -X DELETE http://localhost:8080/engine-rest/user/demo -u demo:demo

echo "Creating admin user..."
curl -s -X POST http://localhost:8080/engine-rest/admin/setup/default/tenant -H "Content-Type: application/json" -d '{
  "profile": {
    "id": "intelli-admin",
    "firstName": "Admin",
    "lastName": "User",
    "email": "admin@example.com"
  },
  "credentials": {
    "password": "intelli-pass"
  },
  "initialPassword": "intelli-pass"
}'

# Start Camunda
catalina.sh run