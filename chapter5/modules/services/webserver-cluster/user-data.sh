#!/bin/bash

cat > index.html <<EOF
<h1>${server_text}</h1>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
<p>Cluster name: ${cluster_name}</p>
EOF

nohup busybox httpd -f -p ${server_port} &
