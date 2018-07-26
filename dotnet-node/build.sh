VERSION=2.1.302-node-10.7.0
docker build -t danielmunchcko/dotnet:$VERSION .
docker push danielmunchcko/dotnet:$VERSION