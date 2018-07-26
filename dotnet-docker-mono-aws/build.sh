VERSION=2.1.302-mono-5.12.0.301-aws-1.15.65
docker build -t danielmunchcko/dotnet-mono-aws:$VERSION .
docker push danielmunchcko/dotnet-mono-aws:$VERSION