0x1A-application_server
Overview
This project focuses on setting up an application server to serve dynamic content for web applications. The goal is to configure and manage an application server that can host multiple services efficiently.

Key Components
Nginx: Used as a reverse proxy server to manage incoming traffic and direct it to the appropriate application services.
Gunicorn: A Python WSGI HTTP Server for running the Flask application.
Flask: A lightweight web application framework to handle the application's routes and responses.
tmux: Terminal multiplexer for managing multiple terminal sessions.
Setup Instructions
Update and Install Packages

bash
Copy code
sudo apt-get update
sudo apt-get install -y nginx python3-pip net-tools gunicorn tmux
pip install flask flask_cors sqlalchemy
Clone Repositories

bash
Copy code
rm -rf AirBnB_clone_v*
git clone https://github.com/hardope/AirBnB_clone_v2
git clone https://github.com/hardope/AirBnB_clone_v3
git clone https://github.com/hardope/AirBnB_clone_v4
Configure Nginx

bash
Copy code
sudo nano /etc/nginx/sites-available/default
Add the following configuration:

nginx
Copy code
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;
    server_name 34.227.91.253;
    add_header X-Served-By 529309-web-01;

    location /hbnb_static { 
        alias /data/web_static/current/;
    }

    location /static/ {
        alias /home/ubuntu/AirBnB_clone_v4/web_dynamic/static/;
        try_files $uri $uri/ =404;
    }

    location / {
        proxy_pass http://0.0.0.0:5003;
    }

    location /airbnb-onepage {
        proxy_pass http://0.0.0.0:5000/airbnb-onepage;
    }

    location ~ ^/airbnb-dynamic/number_odd_or_even/([0-9]+)$ {
        proxy_pass http://0.0.0.0:5001/number_odd_or_even/$1;
    }

    location /api/ {
        proxy_pass http://0.0.0.0:5002;
    }

    if ($request_filename ~ redirect_me){
        rewrite ^ https://th3-gr00t.tk/ permanent;
    }

    error_page 404 /error_404.html;
    location = /error_404.html {
        internal;
    }
}
Restart Nginx

bash
Copy code
sudo systemctl restart nginx
Run Flask Applications with Gunicorn and Tmux

bash
Copy code
cd /home/ubuntu/AirBnB_clone_v3
tmux new-session -d 'gunicorn --bind 0.0.0.0:5002 api.v1.app:app'

cd /home/ubuntu/AirBnB_clone_v4
git checkout app-server
Author
Kyuell, Student of ALX Africa


