FROM ubuntu:16.04
LABEL maintainer="Eric Odell <eric.odell@ucop.edu>"

ARG TERRAFORM_VERSION=0.12.28
ARG TERRAGRUNT_VERSION=0.23.33
ARG NODE_VERSION=12.x
ARG ANSIBLE_VERSION=2.9.12


RUN  echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && \
    # Install add-apt-repository
    apt-get install -y --no-install-recommends software-properties-common && \
    # Update git and install utils
    add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      wget curl git openssh-client jq python3 python3-dev build-essential make \
      ca-certificates tar gzip zip unzip bzip2 gettext-base rsync && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Install AWS CLI
RUN curl -sl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip && \
cd /tmp && unzip awscliv2.zip && ./aws/install  &&\
aws --version

# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_"$NODE_VERSION" | bash -
RUN apt-get install -y --no-install-recommends nodejs \
node --version

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

# Install pip
RUN wget "https://bootstrap.pypa.io/get-pip.py" -O /tmp/get-pip.py && \
    python3 /tmp/get-pip.py && \
    pip3 --version

# Install Ansible
RUN pip3 install "ansible==$ANSIBLE_VERSION" && \
ansible --version

# Install boto and boto3
# boto is installed from maishsk:develop until https://github.com/boto/boto/pull/3794 is merged
RUN pip3 install boto3 && \
    git clone -b develop https://github.com/maishsk/boto.git && \
    cd boto && \
    python3 setup.py install

# Install Terraform
RUN curl -sL https://releases.hashicorp.com/terraform/"$TERRAFORM_VERSION"/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip -o /tmp/terraform.zip && \
    unzip /tmp/terraform.zip -d /usr/bin && \
    chmod +x /usr/bin/terraform && \
    terraform --version

# Install Terragrunt
RUN curl -sL https://github.com/gruntwork-io/terragrunt/releases/download/v"$TERRAGRUNT_VERSION"/terragrunt_linux_amd64 -o /usr/bin/terragrunt && \
    chmod +x /usr/bin/terragrunt && \
    terragrunt --version

# Install yq
RUN pip install yq

# Clean up
RUN     rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
