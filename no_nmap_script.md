### Easy network scanner with netstat and grab the headers

```
netstat -nlt | grep 'tcp ' | grep -Eo "[1-9][0-9]*" | xargs -I {} sh -c "echo "" | nc -v -n -w1 127.0.0.1 {}"
netstat -nlt | awk -F : '/\<tcp\>/ {split($2,a," "); print a[1]}' | xargs -I % bash -c 'echo -ne "\033[1;33m[+]\033[m Port %:\t$(timeout 1 cat </dev/tcp/127.0.0.1/%)\n"'
```

