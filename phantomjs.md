### PhantomJS to get the complete URL found in the recon result

#### InstalL TL;TR
```
sudo apt-get install build-essential chrpath libssl-dev libxft-dev
sudo apt-get install libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 
tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/
sudo ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
export OPENSSL_CONF=/etc/ssl/
phantomjs --version
```

### Single basic usage 
`$ phantomjs --ssl-protocol=any --proxy=127.0.0.1:8080 kk.js "http://www.example.domain:8181"`

```
//kk.js [url as parameter]
var page = require('webpage').create();
var system = require('system');
var address = system.args[1]; 
var address = address.replace(/@/gi,"&");
page.open(address, function(status) {

window.setTimeout(function () {
console.log(page.url);

page.render('result.png'); //remove if you not want take a screenshot from the web

phantom.exit();
}, 3000);
});
```

### Giving a list of urls
```
#!/bin/bash
#List of urls in a txt
filename=$1
n=1
while read line; do
# reading each line
phantomjs kk.js "$line" 
phantomjs --ssl-protocol=any kk.js "$line" --useragent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36" | tee -a result_kkphatomjs.txt
n=$((n+1))
done < $filename
```

### TODO
`phantomjs --ssl-protocol=any kk.js "$line" --useragent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36" `

* Set proxy in the JS with:
`phantom.setProxy('127.0.0.1', '8080', 'socks4');`

