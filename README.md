File tài liệu tìm hiểu:
https://docs.google.com/document/d/1uvxjuz-4acr1wTALznB-AFlFr_9qfGLanX27sQxjSzc/edit


--------------------------------------------------------------------------------------

k8s: cluster ảo minikube: 192.168.39.47
jenkins: localhost:8080 ( docker )
ansible server: localhost

elasticsearch: localhost:9200 ( docker )
kibana: localhost:5601 ( docker )


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
minikube mount /home/thanhnga/Documents/learn/project/logs/tomcat:/data/pv2
--------------------------------------------------------------------------------------------

Lỗi: Elastic và kibana chạy quá nhiều ram, cần vào chỉnh lại trong node.option ( với kibana ) và
thông số -Xmx2g và Xms2g