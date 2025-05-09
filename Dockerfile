# Development
FROM node:22-alpine AS development
ENV NODE_ENV=development
EXPOSE 9229
# Set global npm dependencies to be stored under the node user directory
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

RUN apk update && \
    apk add --no-cache git

USER node
WORKDIR /home/node
COPY --chown=node:node package*.json ./
RUN npm install
COPY --chown=node:node ./app ./app
CMD [ "npm", "run", "start:watch" ]

# Production
FROM development AS production
ENV NODE_ENV=production
RUN npm ci --no-scripts
CMD [ "node", "app" ]
