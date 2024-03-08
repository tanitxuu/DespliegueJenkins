FROM jenkins/jenkins

USER root

#Instalamos como Root nodejs y npm
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \  
    apt-get install -y nodejs && \ 
    apt-get install -y npm

#Para poder hacer npm install, necesitamos darle permisos de escritura a otros en node_modules.
RUN mkdir /usr/local/lib/node_modules && \
	chmod -R o+w /usr

USER jenkins

#Puerto para acceder al administrador de Jenkins
EXPOSE 8080 
#Puerto para comunicaciones con los agentes de Jenkins
EXPOSE 5000
#Puerto para el despliegue en node.
EXPOSE 3000
