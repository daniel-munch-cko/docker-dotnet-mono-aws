VERSION=2.2.100-node-10.15.0
docker build -t danielmunchcko/dotnet:$VERSION .
docker push danielmunchcko/dotnet:$VERSION