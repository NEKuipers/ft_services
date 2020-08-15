# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: nkuipers <nkuipers@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/08/15 12:39:24 by nkuipers      #+#    #+#                  #
#    Updated: 2020/08/15 12:40:07 by nkuipers      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable ingress
minikube addons enable dashboard
minikube dashboard &
