FROM jetbrains/teamcity-minimal-agent

# Register the trusted Microsoft signature key:
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
     mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# Install https transport
RUN apt-get install apt-transport-https -y

# Register the Microsoft Product feed for Ubuntu 16.04
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'

# Update the products available for installation, then install the .NET SDK.
RUN apt-get update && apt-get install dotnet-sdk-2.0.2 -y