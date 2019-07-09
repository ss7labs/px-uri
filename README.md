## Initial proxmox API connection

    curl --silent --insecure --data "username=root@pam&password=" \
    https://10.19.144.11:8006/api2/json/access/ticket \
    | jq --raw-output '.data.ticket' | sed 's/^/PVEAuthCookie=/' > ~/cookie

    curl --silent --insecure --data "username=root@pam&password=" \
    https://10.19.144.11:8006/api2/json/access/ticket \
    | jq --raw-output '.data.CSRFPreventionToken' | sed 's/^/CSRFPreventionToken:/' > ~/csrftoken
