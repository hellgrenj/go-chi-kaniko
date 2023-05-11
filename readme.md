## skaffold, podman, k3s and local registry

setup local private registry:  
``mkdir local-registry``  
..and then  
``podman run -d --name registry -p 5000:5000 -v ./local-registry:/var/lib/registry --restart=always registry:2``  

conf podman:  
sudo nano /etc/containers/registries.conf  
=> ```insecure = true``` (allow insecure registries)  
.. restart (sudo systemctl restart podman)

conf k3s:  (tweed is the hostname)  
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

delete env with:  
```./delete.sh```