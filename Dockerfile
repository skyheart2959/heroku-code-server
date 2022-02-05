FROM artemisfowl004/code-server

USER coder
WORKDIR /home/coder
RUN code-server --install-extension liximomo.sftp  --force
RUN code-server --install-extension ms-python.python --force
RUN code-server --install-extension formulahendry.code-runner --force
COPY run.sh /home/coder
RUN mkdir -p /home/coder/.vscode
COPY sftp.json /home/coder/.vscode
CMD bash /home/coder/run.sh ; /usr/local/bin/code-server --host 0.0.0.0 --port 8080 /home/coder

#FROM nixos/nix
#RUN nix-env -i code-server
#RUN echo $PORT 
#RUN mkdir coder
#RUN export PASSWORD="$PASSWORD"
#RUN code-server --auth password --bind-addr 0.0.0.0:$PORT coder/
