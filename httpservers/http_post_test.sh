#!/bin/bash
head="POST /statuses/update.json HTTP/1.1\r\n
Host: twitter.com\r\n
Authorization: Basic myname:passwordinbs64\r\n
Content-type: application/x-www-form-urlencoded\r\n
Content-length: 10\r\n
Connection: Close\r\n\r\n
status=mymessage";




for i in {1..5}
do
     echo $head | nc localhost 8080
done
