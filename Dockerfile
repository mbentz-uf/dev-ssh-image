FROM mbentzuf/dev-base-image:1.0.0
LABEL maintainer = "mbentz@ufl.edu"
LABEL version = "1.0.0"

ENTRYPOINT [ "/home/cts-dev/.ssh/init.sh" ]
