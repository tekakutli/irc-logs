#!/usr/bin/env sh

#updates every 15 minutes when my pc is on

place=/home/tekakutli/code/mine
irclogs=$place/irc-logs
cd $irclogs

# $place/routes/bouncer.sh nyxt > $irclogs/clojure.txt
# sed -i "1s/^/updated every 15 minutes (when Im online)\n\n/" $irclogs/clojure.txt

# $place/routes/bouncer.sh localmodels > $irclogs/localmodels.txt
# sed -i "1s/^/updated every 15 minutes (when Im online)\n\n/" $irclogs/localmodels.txt
#
# # printf "\nupdated every 15 minutes (when I'm online)\n" >> $irclogs/modelslocal.txt
# # tac $irclogs/modelslocal.txt > $irclogs/localmodels.txt
# # rm $irclogs/modelslocal.txt
# # # $place/routes/bouncer.sh localmodels | sed 's/$/<br>/' > $place/irc-logs/localmodels.html

$place/routes/bouncer.sh nyxt > $irclogs/nyxt.txt
sed -i "1s/^/updated every 15 minutes (when Im online)\n\n/" $irclogs/nyxt.txt
# printf "\nupdated every 15 minutes (when I'm online)\n" >> $irclogs/inversenyxt.txt
# tac $irclogs/inversenyxt.txt > $irclogs/nyxt.txt
# rm $irclogs/inversenyxt.txt


cd $place/irc-logs

git add -A
git add .
random=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
git commit -m "$random"
git push

#wget https://raw.githubusercontent.com/tekakutli/irc-logs/master/localmodels.html
#firefox-developer-edition localmodels.html
#echo localmodels.html | sed 's/<br>//' > localmodels.txt




# sudo ln -s /home/tekakutli/files/code/mine/irc-logs/update.service /etc/systemd/system/update.service
# sudo ln -s /home/tekakutli/files/code/mine/irc-logs/update.timer /etc/systemd/system/update.timer
# systemctl daemon-reload
# systemctl start update.timer
# systemctl enable update.timer
# systemctl list-timers --all

# systemctl --type=service
#
# fix: detected dubious ownership in repository by journalctl
# git config --global --add safe.directory /home/tekakutli/files/code/mine/irc-logs
