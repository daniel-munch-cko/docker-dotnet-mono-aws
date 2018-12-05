VERSION=2.2.100
docker build -t danielmunchcko/dotnet:$VERSION .
docker push danielmunchcko/dotnet:$VERSION