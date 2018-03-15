VERSION=2.0.6-sdk-2.1.101-mono-5.10.0.160-aws-1.14.56
docker build -t danielmunchcko/dotnet-mono-aws:$VERSION .
docker push danielmunchcko/dotnet-mono-aws:$VERSION