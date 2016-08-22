FROM centos

RUN yum -y install /usr/bin/ps nfs-utils && yum clean all
RUN mkdir -p /exports
ADD run_nfs.sh /usr/local/bin/

# Expose nfsd(port 2049) and mountd(port 20048)
EXPOSE 2049/tcp 20048/tcp

ENTRYPOINT ["/usr/local/bin/run_nfs.sh", "/exports"]
