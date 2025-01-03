FROM golang:latest

ENV TERRAFORM_VERSION=1.10.3
ENV TERRAGRUNT_VERSION=v0.71.2-alpha2024122002
ENV ARCH=arm64

# install terraform
RUN apt-get update && apt-get install unzip zip less apt-transport-https ca-certificates gnupg -y && \
    curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    apt-get clean && \
    curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && curl https://keybase.io/hashicorp/pgp_keys.asc | gpg --import \
    && curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig \
    && gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && shasum -a 256 -c terraform_${TERRAFORM_VERSION}_SHA256SUMS 2>&1 | grep "${TERRAFORM_VERSION}_linux_amd64.zip:\sOK" \
    && unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# Install opentofu
RUN curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh && \
    chmod +x install-opentofu.sh && \
    ./install-opentofu.sh --install-method deb && \
    rm -f install-opentofu.sh

# Install gcloud and awscli
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
        apt-get update && apt-get install -y google-cloud-sdk && \
        apt-get install -y awscli && \
        apt-get clean

# Install azure-cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    apt-get clean

# Install terragrunt
RUN TERRAGRUNT_URL="https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_${ARCH}" && \
wget -q "${TERRAGRUNT_URL}" -O /usr/local/bin/terragrunt && \
chmod +x /usr/local/bin/terragrunt

RUN mkdir /tfcode
# COPY . /tfcode
WORKDIR /tfcode
