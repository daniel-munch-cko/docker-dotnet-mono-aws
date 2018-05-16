FROM microsoft/dotnet:2.1.300-rc1-sdk-stretch

# Install mono latest
# http://www.mono-project.com/download/#download-lin-debian
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
	&& echo "deb http://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official.list \
	&& apt-get update \
	&& apt-get install -y mono-devel \
	&& rm -rf /var/lib/apt/lists/*

# Install Docker CLI only. We don't need the daemon since we map the socket as a volume
# https://forums.docker.com/t/installing-only-the-client-cli-daemon-is-on-another-host/27635
# http://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/
RUN curl https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz | tar -xz docker/docker \
    && mv docker/docker /usr/bin \
    && rmdir docker

# Get latest version of AWS command line tools
# https://docs.aws.amazon.com/cli/latest/userguide/installing.html
RUN curl https://bootstrap.pypa.io/get-pip.py > get-pip.py \
    && python get-pip.py \
    && pip install awscli --upgrade \
    && rm get-pip.py \
    && pip uninstall -y pip

WORKDIR /src