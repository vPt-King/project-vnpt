File tài liệu tìm hiểu:
https://docs.google.com/document/d/1uvxjuz-4acr1wTALznB-AFlFr_9qfGLanX27sQxjSzc/edit


--------------------------------------------------------------------------------------

k8s: cluster ảo minikube: 192.168.39.47
jenkins: localhost:8080
ansible server: localhost


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

4. Push commit len github