#Check your access to a list of servers.
RED='\033[0;31m'        #RED
GREEN='\033[0;32m' #GREEN
YELLOW='\033[0;33m' #YELLOW
NC='\033[0m' # No Color

for x in `cat /home/$USER/NodeList`
 do

        ssh -q $USER@$x 'uname -a'| awk '{print $2}'>/home/$USER/checkhost
		
                checkhostz=$(cat /home/$USER/checkhost)
                if [ "$checkhostz" == "$x" ]; then
                        printf "$x ${GREEN} Access passed${NC}\n"
                else
                        printf "$x ${RED}ACCESS DENIED!!!! ${NC}\n"
                fi


 done
 rm -rf /home/$USER/checkhost
 rm -rf /home/$USER/NodeList
