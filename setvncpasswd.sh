#!/usr/bin/expect -f

set VNC_PASSWORD $env(VNC_PASSWORD)

set timeout -1
spawn vncpasswd
match_max 100000
expect -exact "Using password file /root/.vnc/passwd\r
Password: "
send -- "$VNC_PASSWORD\r"
expect -exact "\r
Verify:   "
send -- "$VNC_PASSWORD\r"
expect -exact "\r
Would you like to enter a view-only password (y/n)? "
send -- "n\r"
expect eof

