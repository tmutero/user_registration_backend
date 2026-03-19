FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY ["user_registration.csproj", "./"]
RUN dotnet restore "user_registration.csproj"

COPY . .
RUN dotnet build "user_registration.csproj" -c Release -o /app/build
RUN dotnet publish "user_registration.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
EXPOSE 8080

ENV ASPNETCORE_ENVIRONMENT=Development
ENV ASPNETCORE_URLS=http://+:8080

COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "user_registration.dll"]