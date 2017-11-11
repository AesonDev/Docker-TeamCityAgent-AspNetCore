FROM jetbrains/teamcity-minimal-agent

#U pdate Ubuntu
RUN apt-get update && apt-get -y upgrade

# Register the trusted Microsoft signature key:
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
     mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# Install https transport
RUN apt-get install apt-transport-https -y

# Register the Microsoft Product feed for Ubuntu 16.04
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'

# Update the products available for installation, then install the .NET SDK.
RUN apt-get update && apt-get install dotnet-sdk-2.0.2 -y

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash && apt-get install -y nodejs

# Install git
RUN apt-get install -y git

# install MAKE
RUN apt-get install -y make 

#install Angular Cli
RUN git clone -b 1.5.x https://github.com/angular/angular-cli.git && cd angular-cli && npm link

#update package
RUN apt-get update