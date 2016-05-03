#SSH key maker script 
#This script is a ssh key generator and distributor
#created by Nick Farrow
#https://github.com/VeggieVampire/SSH-Key-Helper
#creates key
ssh-keygen -t rsa

for x in `cat NodeList`
do
        echo "$x"
        #Makes a ssh directory under your home directory
		echo "making a .ssh directory for your keys"
        ssh –q $USER@$x mkdir -p .ssh
        #places the key you generated above onto the server
        cat .ssh/id_rsa.pub | ssh $USER@$x 'cat >> .ssh/authorized_keys'
        #checks if connection works
        ssh –q $USER@$x 'echo $HOSTNAME'
done

echo "..............Checking access...................."
./access_check.sh
