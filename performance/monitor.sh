###############################################################################
# 
# Create summary report for system.
#
# Usage example(s):
#
#	add root cron job: sudo crontab -e
#	
#	./monitor.sh | mail -s "Status Report for 'ubu-playpen'" madge.ick.8.ball@gmail.com
#
###############################################################################

unset os architecture kernelrelease internalip externalip nameserver loadaverage

{
	# Check if connected to Internet or not
	ping -c 1 google.com &> /dev/null && echo -e "Internet: Connected" || echo -e "Internet: Disconnected"

	# Check OS Type
	os=$(uname -o)
	echo "Operating System Type :" $os

	# Check OS Release Version and Name
	cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
	echo -n -e "OS Name :"   && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
	echo -n -e "OS Version :"  && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"

	# Check Architecture
	architecture=$(uname -m)
	echo -e "Architecture :"  $architecture

	# Check Kernel Release
	kernelrelease=$(uname -r)
	echo -e "Kernel Release :"  $kernelrelease

	# Check hostname
	echo -e "Hostname :"  $HOSTNAME

	# Check Internal IP
	internalip=$(hostname -I)
	echo -e "Internal IP :"  $internalip

	# Check External IP
	externalip=$(curl -s ipecho.net/plain;echo)
	echo -e "External IP :  "$externalip

	# Check DNS
#	nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
#	echo -e "Name Servers :"  $nameservers 

        # Check System Uptime
        tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
        echo -e "System Uptime Days/(HH:MM) :"  $tecuptime

        # Check Logged In Users
        who>/tmp/who
        echo -e "Logged In users :"  && cat /tmp/who
        
	# Check Load Average
        loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
        echo -e "Load Average :"  $loadaverage

	# Check RAM and SWAP Usages
	free -h | grep -v + > /tmp/ramcache
	echo -e "Ram Usages :" 
	cat /tmp/ramcache | grep -v "Swap"
	echo -e "Swap Usages :" 
	cat /tmp/ramcache | grep -v "Mem"

} > /tmp/report

cat /tmp/report
#cat /tmp/report | mail -s "Status Report for 'ubu-playpen'" madge.ick.8.ball@gmail.com

# Unset Variables
unset os architecture kernelrelease internalip externalip nameserver loadaverage

# Remove Temporary Files
rm /tmp/osrelease /tmp/who /tmp/ramcache /tmp/report

