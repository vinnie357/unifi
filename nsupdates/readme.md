# nsupdates

 - gets active clients host name from udm
 - asks udm for the assigned lease address
 - uses nsupdate to add the records to your dns server

## tools
```
apt install jq curl
```
## set env vars
```
UDM_USER=myuser
UDM_PASS=mypass
UDM_HOST=udm.example.com
UDM_SITE=default
DNS_HOST=dns.example.com
DNS_DOMAIN=example.com
```
## load script
```
. update.sh
```
## run
update


## docker
```bash
docker build -t unifiupdate .

docker run -it --rm \
-e UDM_USER=myuser \
-e UDM_PASS=mypass \
-e UDM_HOST=udm.example.com \
-e UDM_SITE=default \
-e DNS_HOST=dns.example.com \
-e DNS_DOMAIN=example.com \
 unifiupdate
```
## k8s job
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: unifiupdate
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: unifiupdate
            image: unifiupdate
            imagePullPolicy: IfNotPresent
            env:
            - UDM_USER=myuser
            - UDM_PASS=mypass
            - UDM_HOST=udm.example.com
            - UDM_SITE=default
            - DNS_HOST=dns.example.com
            - DNS_DOMAIN=example.com
          restartPolicy: OnFailure
```
