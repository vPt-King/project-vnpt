File tài liệu tìm hiểu:
https://docs.google.com/document/d/1uvxjuz-4acr1wTALznB-AFlFr_9qfGLanX27sQxjSzc/edit


--------------------------------------------------------------------------------------

k8s: cluster ảo minikube: 192.168.39.47
jenkins: localhost:8080 
ansible server: localhost

elasticsearch: localhost:9200
kibana: localhost:5601


---------------------------------------------------------------------------------------

1. Dùng ngrok để public locahost:8080 (jenkins) ra internet 
    - ngrok http 8080
    - vào github -> chọn repository -> chọn setting -> chọn webhook -> edit webhook -> copy đường dẫn ngrok vừa nãy {ngrok link}/github-webhook/

2. Cấp quyền cho lệnh docker  
    - sudo chmod 777 /var/run/docker.sock

3. Cấu hình jenkins
    - New items
    - Nhập tên: project - chọn pipeline
    - Cấu hình: 
        + Build Triggers: GitHub hook trigger for GITScm polling 
        + Pipeline: Pipeline script from SCM ( Nhập link repository của git vào url )
        + script path: jenkins/Jenkinsfile

4. Ansible cấu hình pull image và apply file yaml cho k8s

5. Cai elasticsearch va kibana,fluentd


Sử dụng minikube để mount trực tiếp vào host
sshfs -o ssh_command='ssh -i ssh -i ~/.minikube/machines/minikube/id_rsa' dock
er@192.168.39.47:/data/pv2 /home/thanhnga/Documents/learn/project/logs/tomcat
--------------------------------------------------------------------------------------------

Lỗi: Elastic và kibana chạy quá nhiều ram, cần vào chỉnh lại trong node.option ( với kibana ) và
thông số -Xmx2g và Xms2g

Lỗi: 
+ Lỗi không tìm thấy kubectl khi chạy ansible => fix: tải binary kubectl và thông báo viết rõ đường dẫn kubectl đồng thời thêm file kubeconfig

TASK [deploy application to k8s] ***********************************************
fatal: [localhost]: FAILED! => {"changed": true, "cmd": ["kubectl", "get", "pod"], "delta": "0:00:00.048449", "end": "2024-07-10 07:57:18.814553", "msg": "non-zero return code", "rc": 1, "start": "2024-07-10 07:57:18.766104", "stderr": "E0710 07:57:18.808709   19301 memcache.go:265] couldn't get current server API group list: <html><head><meta http-equiv='refresh' content='1;url=/login?from=%2Fapi%3Ftimeout%3D32s'/><script id='redirect' data-redirect-url='/login?from=%2Fapi%3Ftimeout%3D32s' src='/static/8ce9986d/scripts/redirect.js'></script></head><body style='background-color:white; color:white;'>\nAuthentication required\n<!--\n-->\n\n</body></html>\nE0710 07:57:18.810015   19301 memcache.go:265] couldn't get current server API group list: <html><head><meta http-equiv='refresh' content='1;url=/login?from=%2Fapi%3Ftimeout%3D32s'/><script id='redirect' data-redirect-url='/login?from=%2Fapi%3Ftimeout%3D32s' src='/static/8ce9986d/scripts/redirect.js'></script></head><body style='background-color:white; color:white;'>\nAuthentication required\n<!--\n-->\n\n</body></html>\nE0710 07:57:18.811171   19301 memcache.go:265] couldn't get current server API group list: <html><head><meta http-equiv='refresh' content='1;url=/login?from=%2Fapi%3Ftimeout%3D32s'/>