FROM gitlab/gitlab-ce:12.10.0-ee.0

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ $(. /etc/os-release && echo $VERSION_CODENAME)-pgdg main" | tee  /etc/apt/sources.list.d/pgdg.list && \
    apt update && \
    apt install -y postgresql-client-12 && \
    cp -Rpf /usr/lib/postgresql/12/bin/pg_dump /opt/gitlab/bin/ && \
    cp -Rpf /usr/lib/postgresql/12/bin/psql /opt/gitlab/bin/
