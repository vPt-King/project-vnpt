1. Ngrok http 8080 -> vào github repo java-tomcat-k8s-jenkins-ansible đổi lại link
2. Bật minikube
3. update chmod 777 /var/run/docker.sock
4. push code moi len github






------------------------------------------------------------------------

Lỗi: 
+ Lỗi không tìm thấy kubectl khi chạy ansible => fix: tải binary kubectl và thông báo viết rõ đường dẫn kubectl đồng thời thêm file kubeconfig

TASK [deploy application to k8s] ***********************************************
fatal: [localhost]: FAILED! => {"changed": true, "cmd": ["kubectl", "get", "pod"], "delta": "0:00:00.048449", "end": "2024-07-10 07:57:18.814553", "msg": "non-zero return code", "rc": 1, "start": "2024-07-10 07:57:18.766104", "stderr": "E0710 07:57:18.808709   19301 memcache.go:265] couldn't get current server API group list: <html><head><meta http-equiv='refresh' content='1;url=/login?from=%2Fapi%3Ftimeout%3D32s'/><script id='redirect' data-redirect-url='/login?from=%2Fapi%3Ftimeout%3D32s' src='/static/8ce9986d/scripts/redirect.js'></script></head><body style='background-color:white; color:white;'>\nAuthentication required\n<!--\n-->\n\n</body></html>\nE0710 07:57:18.810015   19301 memcache.go:265] couldn't get current server API group list: <html><head><meta http-equiv='refresh' content='1;url=/login?from=%2Fapi%3Ftimeout%3D32s'/><script id='redirect' data-redirect-url='/login?from=%2Fapi%3Ftimeout%3D32s' src='/static/8ce9986d/scripts/redirect.js'></script></head><body style='background-color:white; color:white;'>\nAuthentication required\n<!--\n-->\n\n</body></html>\nE0710 07:57:18.811171   19301 memcache.go:265] couldn't get current server API group list: <html><head><meta http-equiv='refresh' content='1;url=/login?from=%2Fapi%3Ftimeout%3D32s'/>

+ Thực thi với quyền jenkins: chỉnh lại mật khẩu của jenkins user: sudo passwd jenkins, thêm user jenkins vào sudoers



