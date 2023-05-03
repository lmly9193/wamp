mkcert.exe -uninstall
mkcert.exe -install
mkcert.exe -key-file ../httpd/conf/server.key -cert-file ../httpd/conf/server.crt php82.local "*.php82.local" php74.local "*.php74.local" php73.local "*.php73.local" localhost 127.0.0.1 ::1
pause
