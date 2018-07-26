FROM microsoft/dotnet:2.1.302-sdk-stretch

# Install jessie sources since we need libssl1.0.0 for GitVersion which is incompatible with libssl1.0.2 and not part of stretch
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb http://deb.debian.org/debian jessie main" | tee /etc/apt/sources.list.d/jessie.list \
    && echo "deb http://deb.debian.org/debian jessie-updates main" | tee -a /etc/apt/sources.list.d/jessie.list \
    && echo "deb http://security.debian.org/debian-security jessie/updates main" | tee -a /etc/apt/sources.list.d/jessie.list \
	&& apt-get update \
	&& apt-get install -y libssl1.0.0 xz-utils \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /src