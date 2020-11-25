# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: nkuipers <nkuipers@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/08/15 12:39:24 by nkuipers      #+#    #+#                  #
#    Updated: 2020/11/18 11:35:17 by nkuipers      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!bin/zsh
# create link in goinfre to save memory
rm -rf ~/.minikube/machines
mkdir -p ~/goinfre/machines
ln -s ~/goinfre/machines ~/.minikube/machines
minikube delete
minikube start --driver=virtualbox
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable logviewer

eval $(minikube docker-env)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
kubectl apply -f srcs/metallb-config.yaml > /dev/null

kubectl run nginx --image=nginx
kubectl apply -f srcs/metallb-config.yaml > /pod/nginx

minikube dashboard &