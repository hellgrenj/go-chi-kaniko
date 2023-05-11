conf podman:  
sudo nano /etc/containers/registries.conf  
=> ```insecure = true``` (allow insecure registries)  
.. restart (sudo systemctl restart podman)

conf k3s:  
``
 mirrors:
  "tweed:5000":
    endpoint:
      - "http://tweed:5000"``
.. restart (sudo systemctl restart k3s)

start with:  
```./run.sh```  

dev (reload) with:  
```./dev.sh```