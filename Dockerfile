FROM amazonlinux:latest

# Install python3.7
RUN yum install -y python37

# Install zip and pip-tools so we can manage requirements
RUN yum install -y zip && \
    python3 -m pip install pip-tools

RUN yum install -y make

# required to make pip-compile work
ENV LC_ALL=en_US.utf8

# This is the mount location for the Lambda function directory
VOLUME ["/lambda"]
WORKDIR "/lambda"

# Default entrypoint / command is to package the function
ENTRYPOINT ["make"]
CMD ["package"]
