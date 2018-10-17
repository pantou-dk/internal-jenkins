FROM jenkins/jenkins:latest
RUN curl -J -L https://github.com/openshift/origin/releases/download/v3.10.0/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz -o /tmp/oc.tar.gz && tar xf -C /tmp oc.tar.gz && cp /tmp/oc/oc /usr/bin/oc
