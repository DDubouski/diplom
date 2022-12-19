#!/bin/sh

	ret=$(systemctl is-active nginx)
	if [[ "$ret" != "active" ]] 
then 
{
	service squid nginx
	exit 1
}
else 
{
	echo "EXIT. Nginx already running!"
	exit 1
}
fi;