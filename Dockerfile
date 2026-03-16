FROM jenkins/jenkins:lts

USER root

# Устанавливаем Go (последнюю версию)
RUN apt-get update && \
    apt-get install -y wget git && \
    wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz && \
    rm go1.22.5.linux-amd64.tar.gz

# Устанавливаем Ansible
RUN apt-get install -y ansible && \
    apt-get clean

# Добавляем Go в PATH для всех пользователей
ENV PATH=$PATH:/usr/local/go/bin

USER jenkins