FROM amazon/aws-cli:2.x

WORKDIR /app

COPY terminate.sh /app/terminate.sh

RUN chmod +x /app/terminate.sh

# Set the entrypoint to your script
ENTRYPOINT ["/app/terminate.sh"]
