FROM node

# Create app directory
WORKDIR /opt/app-root/src

COPY ./my-server/package*.json ./
RUN npm install --production
COPY ./my-server/ .

EXPOSE 3001

CMD [ "npm", "run", "start" ]