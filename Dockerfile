FROM node:lts

RUN corepack enable && corepack prepare pnpm@9.15.4 --activate

WORKDIR /app
RUN mkdir /app/store
COPY . /app/store

WORKDIR /app/store
RUN pnpm install
RUN pnpm build

EXPOSE 8000
CMD ["pnpm", "start"]