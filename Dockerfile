FROM node:8.11-alpine

ARG DB_USERNAME
ARG DB_PASSWORD

ENV DEVOPS_TEST_DATABASE_NAME='devops_test' \
    DEVOPS_TEST_DATABASE_HOST='cantigua-devops-practice.ccyum0gfaodn.us-east-2.rds.amazonaws.com' \
    DEVOPS_TEST_ENV='production' \
    DEVOPS_TEST_DATABASE_USERNAME=${DB_USERNAME} \
    DEVOPS_TEST_DATABASE_PASSWORD=${DB_PASSWORD} 
COPY . .
RUN npm install
RUN npm run migrate-up
ENTRYPOINT 3082
CMD ["npm", "run", "start"]
