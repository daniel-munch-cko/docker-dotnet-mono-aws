# dotnet-mono-aws

The one stop shop for building containerized .NET Core applications with [Cake](https://cakebuild.net/) and pushing them to AWS ECR.

## Command line use

Given your current working directory is the root of your sources, the following command starts the Cake bootstrapper inside the container.

```bash
docker run -it  -v /var/run/docker.sock:/var/run/docker.sock -v $(PWD):/src danielmunchcko/dotnet-mono-aws:2.0.5-sdk-2.1.4-mono-5.4.1.7-aws-1.14.32 ./build.sh
```

## TeamCity integration

Using the TeamCity [Docker Wrapper](https://confluence.jetbrains.com/display/TCD10/Docker%20Wrapper) it is easy to configure a [Command Line](https://confluence.jetbrains.com/display/TCD10/Command+Line) build runner.

Use the following container in the *Run step within Docker container* field

```docker
danielmunchcko/dotnet-mono-aws:2.0.6-sdk-2.1.101-mono-5.10.0.160-aws-1.14.56
```

Make sure to supply the following *Additional docker run arguments*:
```bash
-v /var/run/docker.sock:/var/run/docker.sock -v /home/ckouser/.aws:/root/.aws -v /home/ckouser/.nuget:/root/.nuget
```

These arguments enable the following (in order of their appearance):

- Map the docker socket into the container, enabling us to build docker images inside a running container

  See this article for further reading. http://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/ 

  We're using the approach mentioned in *Solution* at the end of the article, the docker cli client binary not being mapped but installed in the image.
- Map the .aws credentials directory, so that we are able to authorize and push to ECR
- Map the .nuget folder, to speed up nuget download and use the common cache of packages

![teamcity-build-step-command-line-config](doc/teamcity-build-step-command-line-config.png)


## Versions

The following versions are currently available on Docker hub.

- danielmunchcko/dotnet-mono-aws:2.0.5-sdk-2.1.4-mono-5.4.1.7-aws-1.14.32
- danielmunchcko/dotnet-mono-aws:2.0.6-sdk-2.1.101-mono-5.10.0.160-aws-1.14.56
- danielmunchcko/dotnet-mono-aws:2.1.300-rc1-mono-5.12.0.226-aws-1.15.21 - DO NOT USE, issue with GitVersion
- danielmunchcko/dotnet-mono-aws:2.1.300-rc1-mono-5.12.0.226-aws-1.15.26
- danielmunchcko/dotnet-mono-aws:2.1.302-mono-5.12.0.301-aws-1.15.65

Additionally there are those images available:
- danielmunchcko/dotnet:2.1.302: Based straight on microsoft/dotnet:2.1.302-sdk-stretch, with additional dependencies for GitVersion
- danielmunchcko/dotnet:2.1.402: Based straight on microsoft/dotnet:2.1.402-sdk-stretch, with additional dependencies for GitVersion and docker cli
- danielmunchcko/dotnet:2.1.302-node-10.7.0: Same as above, with node 10.7.0
- danielmunchcko/dotnet:2.1.402-aws-1.16.47: Same as above, with aws cli tools 1.16.47
Use Git history to find their corresponding `Dockerfile` source.