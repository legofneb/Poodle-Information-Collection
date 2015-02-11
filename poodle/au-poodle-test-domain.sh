#!/bin/bash

echo "##BEGIN DOMAIN TESTS $1"
echo "#SSLv3 TEST $1"
./openssl s_client -connect $1:443 -state -ssl3 < au-ssl-command
echo "#SSLv3+SVSC $1"
./openssl s_client -connect $1:443 -state -fallback_scsv -ssl3 < au-ssl-command
echo "#SSLv2 $1"
./openssl s_client -connect $1:443 -state -ssl2 < au-ssl-command
echo "#TLS1 $1"
./openssl s_client -connect $1:443 -state -tls1 < au-ssl-command
echo "#TLS1.1 $1"
./openssl s_client -connect $1:443 -state -tls1_1 < au-ssl-command
echo "#TLS1.2 $1"
./openssl s_client -connect $1:443 -state -tls1_2 < au-ssl-command
echo "#cipherscan"
./cipherscan $1
echo "#tlsprobe"
python2.7 tlsReport.py $1
echo "#portScan"
./nmap-scan.sh $1
echo "##END DOMAIN TESTS $1"
