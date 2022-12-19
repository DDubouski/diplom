#!/bin/sh

	ret=$(systemctl is-active nginx)
	if [[ "$ret" != "active" ]] 
then 
{
	echo "EXIT. Something wrong!"
	exit 1
}
else 
{
	echo "EXIT. Nginx already running!"
	exit 1
}
fi;