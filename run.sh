#!/bin/bash

mkdir -p $HOME/.rhc/git $HOME/.rhc/openshift $HOME/.rhc/ssh $HOME/workspace/rhc

docker run --rm -ti -p 3000 -v $HOME/.rhc/git:/root/.git -v $HOME/workspace/rhc:/root/src -v /home/goern/.rhc/openshift:/root/.openshift -v /home/goern/.rhc/ssh:/root/.ssh rhc /bin/bash

#end.
