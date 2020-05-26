# ft_server
ft_server sources


* https://stackoverflow.com/questions/59636347/mysql-wont-start-using-dockerfile/59637193#59637193
* https://stackoverflow.com/questions/16747035/how-do-i-create-a-user-with-the-same-privileges-as-root-in-mysql-mariadb
* https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10
* https://www.drupaldump.com/how-install-and-use-phpmyadmin-docker
* https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-debian-9
* https://linuxize.com/post/how-to-create-mysql-user-accounts-and-grant-privileges/
* https://serversforhackers.com/c/redirect-http-to-https-nginx
* https://serversforhackers.com/c/redirect-http-to-https-nginx
* https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04
* https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs
* https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-debian-9
* https://docs.docker.com/config/containers/multi-service_container/

how to build and run dockerfile?

* docker build [option] [image name] [path]
   
   exemple -> docker build -t ft_server .
* docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
    
    example -> docker run -it -p 80:80 -p 443:443 ft_server
    
* useful commands

    docker exec -it [container id] bash  ->  to access container bash
