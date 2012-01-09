if ifconfig | grep 157.199.
then
    export http_proxy="http://cache.pasteur.fr:8080"
    export https_proxy="http://cache.pasteur.fr:8080"
    export ftp_proxy="http://cache.pasteur.fr:8080"
fi
