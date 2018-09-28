#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt-get install apache2

# Récupération des informations de l'utilisateur à créer
echo "Nom de login :"
read user_logname
echo "Mot de passe :"
read user_password
echo "Confirmer le mot de passe :"
read user_password_confirm

if [ $user_password != $user_password_confirm ]
then
#	Erreur : mot de passe non confirmé
	exit 1
fi

# Création de l'utilisateur
sudo useradd "$user_logname" || (passwd $user_password) 


