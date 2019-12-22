#!/bin/bash

# Netcat is a utility that reads and writes data across network connections, using the TCP or UDP protocol.

#{ echo -ne "HTTP/1.0 200 OK\r\n\r\n"; cat some.file; } | nc -l -p 8080


# listen for TCP traffic from client on port 8080
# when request received:
# 	count the number of bytes in file
# 	return to client:
#		http 200
# 		# bytes in file as http header "Content-Length" (http headers are just text at the start of the file)
#		contents of file
#
# nc options:
# -l: Used to specify that nc should listen for an incoming connection rather than
# initiate a connection to a remote host. Additionally, any timeouts specified
#  with the -w option are ignored.
# -p: Specifies the source port nc should use, subject to privilege restrictions
# and availability.
# -k: stay listening (keep connection open after completion of each connection)
#
# { } used to group the output from multiple commands
#
# HTTP headers
# HTTP headers are terminated by the sequence \r\n\r\n (a blank line).
#
#
# To Test
#

#{ printf "HTTP/1.0 200 OK\r\n\r\n"; cat text; } | nc -l -p 8080
#{ printf "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < text)\r\n\r\n"; cat text; } | nc -l -k -p 8080

#{ printf "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < text)\r\n\r\n"; cat text; } | nc -l -k -p 8080 | cat > "$(date +"%FT%T").request.$(uuidgen)"

#{ printf "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < text)\r\n\r\n"; cat text; } | nc -l -k -p 8080 >> http_traffic

#while true; do { printf "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < text)\r\n\r\n"; cat text; } | nc -l -k -p 8080 | cat > "$(date +"%FT%T").request.$(uuidgen)" ; done




while true;
	#do request = "$({ printf "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < text)\r\n\r\n"; cat text; } | nc -l -p 8080)" > "request.$(uuidgen)" ; printf "received message\n"
	#do request = "$({ printf "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < text)\r\n\r\n"; cat text; } | nc -l -p 8080)" ; echo "$request" > "request.$(uuidgen)" ; printf "received message at $(date +"%FT%T")\n"
	do { printf "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < text)\r\n\r\n"; cat text; } | nc -l -p 8080 > "request.$(uuidgen)" ; printf "received message at $(date +"%FT%T")\n"
done
