VERSION=2.1.300-rc1-mono-5.12.0.226-aws-1.15.21
docker build -t danielmunchcko/dotnet-mono-aws:$VERSION .
docker push danielmunchcko/dotnet-mono-aws:$VERSION