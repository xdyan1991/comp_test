#!/usr/bin/env sh 

nginx_dir=/usr/local/openresty/nginx/

sudo ln -f -s $(pwd)/conf/*conf ${nginx_dir}/conf/vhosts/

sudo mkdir ${nginx_dir}/scripts
sudo ln -f -s $(pwd)/scripts/*.lua ${nginx_dir}/scripts/

sudo ln -f -s $(pwd)/lualib/comp  ${nginx_dir}/../lualib/
