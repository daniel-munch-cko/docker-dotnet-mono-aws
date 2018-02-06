# dotnet-mono-aws

The one stop shop for building containerized .NET Core applications with [Cake](https://cakebuild.net/) and pushing them to AWS ECR.

## Command line use

Given your current working directory is the root of your sources, the following command starts the Cake bootstrapper inside the container.

```bash
docker run -it  -v /var/run/docker.sock:/var/run/docker.sock -v $(PWD):/src danielmunchcko/dotnet-mono-aws:2.0.5-sdk-2.1.4-mono-5.4.1.7-aws-1.14.32 ./build.sh
```

## TeamCity integration

Using the TeamCity [Docker Wrapper](https://confluence.jetbrains.com/display/TCD10/Docker%20Wrapper) it is easy to configure a [Command Line](https://confluence.jetbrains.com/display/TCD10/Command+Line) build runner.

![teamcity-build-step-command-line-config](doc/teamcity-build-step-command-line-config.png)



