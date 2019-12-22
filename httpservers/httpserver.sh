#!/bin/bash

# Netcat is a utility that reads and writes data across network connections, using the TCP or UDP protocol.

#{ echo -ne "HTTP/1.0 200 OK\r\n\r\n"; cat some.file; } | nc -l -p 8080

{ printf "HTTP/1.0 200 OK\r\n\r\n"; cat some.file; } | nc -l -p 8080
