FROM mbentzuf/dev-base-image:1.0.1
LABEL maintainer = "mbentz@ufl.edu"
LABEL version = "1.0.2"

# inherits WORKDIR /workspace from parent image

ADD https://raw.githubusercontent.com/mbentz-uf/dev-ssh-image/master/.bash_profile /home/cts-dev/.bash_profile
ADD https://raw.githubusercontent.com/mbentz-uf/dev-ssh-image/master/init.sh /usr/local/bin/init.sh

# COPY .bash_profile /home/cts-dev/.bash_profile
# COPY init.sh init.sh

# -rw-r--r--   1 mbentz  staff  1234 Feb 18 14:15 .bash_profile
RUN ["sudo", "chmod", "644", "/home/cts-dev/.bash_profile"]
# -rwxr-xr-x 1 root root   65 Feb 18 19:19 init.sh
RUN ["sudo", "chmod", "755", "/usr/local/bin/init.sh"]

ENTRYPOINT ["init.sh"]
CMD [ "help" ]

