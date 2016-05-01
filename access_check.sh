#Check your access to a list of servers.

for x in `cat /home/$USER/NodeList`
 do

        ssh -q $USER@$x 'uname -a'| awk '{print $2}'>/home/$USER/checkhost
		
		checkhostz=$(cat /home/$USER/checkhost)
		if [ "$checkhostz" == "$x" ]; then
			echo "$x access passed"
		else
			echo "$x ACCESS DENIED  !!!!!!!!"
		fi

 done
 rm -rf /home/$USER/checkhost
 rm -rf /home/$USER/NodeList
