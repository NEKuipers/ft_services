# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: nkuipers <nkuipers@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/08/15 12:39:24 by nkuipers      #+#    #+#                  #
#    Updated: 2020/11/11 14:03:43 by nkuipers      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!bin/zsh
# create link in goinfre to save memory
rm -rf ~/.minikube/machines
mkdir -p ~/goinfre/machines
ln -s ~/goinfre/machines ~/.minikube/machines
minikube delete
minikube start --driver=virtualbox

