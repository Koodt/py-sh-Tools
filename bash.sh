ls -R path |grep -oE '\.[a-z]{3}$' |sort |uniq -c
