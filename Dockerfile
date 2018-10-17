FROM jenkins/jenkins:latest
USER root
RUN curl -J -L https://github.com/openshift/origin/releases/download/v3.10.0/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz -o /tmp/oc.tar.gz && tar xf /tmp/oc.tar.gz -C /tmp && cp /tmp/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit/oc /usr/bin/oc
USER jenkins
