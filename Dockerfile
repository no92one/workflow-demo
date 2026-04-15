FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Kopiera projektfilen först för bättre caching
COPY backend/App/App.csproj backend/App/
RUN dotnet restore backend/App/App.csproj

# Kopiera resten av koden
COPY . .

# Publicera appen
RUN dotnet publish backend/App/App.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://0.0.0.0:10000
EXPOSE 10000

ENTRYPOINT ["dotnet", "App.dll"]
