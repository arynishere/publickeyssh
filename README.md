# publickeyssh
## Why do we need this script?

for share public key with many ips ,
It is for people who want to connect to many servers with "SSHPASS" and don't want to repeatedly ssh to all servers to copy and paste their pulic key and want to do this in the form of a script in all the ip ranges they want.
And at the end, the script itself checks what your OS is and according to that, installs sshpass with yum and apt.
## First step 

you should make a file for your ips and this name is "IP_FILE" for example :

```
1.1.1.1
2.2.2.2
....
```
" this step dont need to enter password or port 

## Secound step 

run this command for use this script 
```
chmod +x PubSsh.sh
bash PubSsh.sh

```

I hope it works for you
