#!/bin/bash

#Créer mon fichier VM
mkdir VM
cd VM

#Demande puis créee le dossier qui sera synchro
echo "Avec quel dossier la VM doit elle ce synchroniser ?"
read synchro
mkdir $synchro


#Créer mon Vagrantfile
touch Vagrantfile

#Ecris dans mon Vagrantfile ce dont j'ai besoin
echo "Vagrant.configure(\"2\") do |config|" >> Vagrantfile
echo "config.vm.box = \"ubuntu/xenial64\" " >> Vagrantfile

#Demande l'IP à l'utilisateur et la met dans mon Vagrantfile
echo "Quel IP souhaitez vous mettre ? Rappel vous devez écrire 192.168.33.(nb au choix)"
read IP
echo "config.vm.network \"private_network\", ip: \"$IP\" " >> Vagrantfile

#Prend en compte le fichier de synchro et fini mon Vagrantfile
echo "config.vm.synced_folder \"./$synchro\", \"/var/www/html\" " >> Vagrantfile
echo "end" >>Vagrantfile

mv script2.sh VM/$synchro
#Lance ma machine est rentre à l'intérieur
vagrant up
vagrant ssh
