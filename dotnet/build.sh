VERSION=2.1.302
docker build -t danielmunchcko/dotnet:$VERSION .
docker push danielmunchcko/dotnet:$VERSION