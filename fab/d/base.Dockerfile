FROM node:12

COPY . /src
WORKDIR /src

RUN yarn install;

#Use an entrypoint that simply lists out all commands sent to it
COPY fab/entryPoint.sh /entryPoint.sh
WORKDIR /src

ENTRYPOINT ["/entryPoint.sh"]
#Allow image to be used standalone without any commands:
CMD ["tail", "-f", "/dev/null"]
