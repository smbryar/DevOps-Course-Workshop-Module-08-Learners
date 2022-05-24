FROM mcr.microsoft.com/dotnet/sdk:6.0
COPY . .
 
# Install npm
RUN apt-get update
RUN apt-get install -y npm

# Build dotnet code
RUN dotnet build

# Move to web folder
WORKDIR /DotnetTemplate.Web

# Build web code
RUN npm ci
RUN npm run build

ENTRYPOINT [ "dotnet", "run" ]