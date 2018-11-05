VERSION=2.1.402-aws-1.16.47
docker build -t danielmunchcko/dotnet:$VERSION .
docker push danielmunchcko/dotnet:$VERSION