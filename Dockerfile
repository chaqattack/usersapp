FROM node:8.11-alpine

ARG DB_USERNAME 
ARG DB_PASSWORD

ENV DEVOPS_TEST_DATABASE_NAME='devops_test' \
    DEVOPS_TEST_DATABASE_HOST='ec2-18-188-252-127.us-east-2.compute.amazonaws.com' \
    DEVOPS_TEST_ENV='production' \
    DEVOPS_TEST_DATABASE_USERNAME=${DB_USERNAME} \
    DEVOPS_TEST_DATABASE_PASSWORD=${DB_PASSWORD} 
COPY . .
RUN npm install
RUN npm run migrate-up
#ENTRYPOINT 3082
CMD ["npm", "run", "start"]
