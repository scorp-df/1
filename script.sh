date=$(date -d "now -4 day" +"%F")
date >> /tmp/2
rsync -zav --backup  -e "ssh -p 22" --progress /opt/Softname/configurate.conf back@172.31.16.37:/backup/configurate_$(date +"%T %F" | sed "s/\:\|\s/_/g").conf.backup >>/tmp/2 2>&1
ssh -l back 172.31.16.37 "cd /backup/ ;ls ./|  grep $date | xargs rm -fv  " >>/tmp/2 2>&1
echo "" >> /tmp/2
