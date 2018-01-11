#!/bin/bash
# Wfuzz --list,.jsp,.html,.php  FUZZFUZ2Z

domain=$1

echo -n "Introduce el dominio:  "
read domain
echo "Comenzando la busqueda de directorios y archivos con WFuzz"
wfuzz -t 10 -c -z file,/home/h4ck1ng/worldlists/spanish.txt -z list,.html-.htm-/- -H "User-Agent:Mozilla/5.0 (X11; U; Linux x86_64; en-us) AppleWebKit/531.2+ (KHTML, like Gecko) Version/5.0 Safari/531.2+" --hh 0 --hc 504,404,301,307,500,400 $domain/FUZZFUZ2Z
echo
