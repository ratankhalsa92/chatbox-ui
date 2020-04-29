FROM node:12

#Use an entrypoint that simply lists out all commands sent to it
COPY fab/entryPoint.sh /entryPoint.sh
ENTRYPOINT ["/entryPoint.sh"]

#Allow image to be used standalone without any commands:
CMD ["tail", "-f", "/dev/null"]
