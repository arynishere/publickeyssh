if [[ -e /etc/debian_version ]]; then
    OS="debian"  
    INSTALL_CMD="sudo apt-get install -y"
elif [[ -e /etc/redhat-release ]]; then
    OS="redhat"  
    INSTALL_CMD="sudo yum install -y"
else
    echo "Unsupported operating system"
    exit 1
fi

if ! command -v sshpass &> /dev/null; then
    echo "Installing sshpass..."
    $INSTALL_CMD sshpass
fi
read -p "enter USERNAME:" USER
read -p "PASSWORD:" PASSWORD
read -p " please chose ip file location :" IP_FILE
read -p " please enter port :" PORT 



IP_LIST=($(cat "$IP_FILE"))


for IP in "${IP_LIST[@]}"
do
    echo "Connecting to $IP..."
    
    sshpass -p "$PASSWORD" ssh-copy-id -i "$SSH_KEY" "$USER"@"$IP" -port "$PORT"
    
    
    echo "Key added to $IP"
done

echo "done!"
