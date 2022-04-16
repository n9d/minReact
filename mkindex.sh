#!/bin/bash

cat << HEAD > index.html
<html>
  <head>
    <meta charset="utf-8"/>
    <title>最小構成でReactJS</title>
  </head>
  <body>
    <p> 詳細は<a href="https://github.com/n9d/minReact">minReact</a>を参照のこと </p>
    <p />
HEAD

for file in *.html; do
  if [ $file != index.html ]; then
    title=`cat $file | ruby -e 'print STDIN.read.match(/<title>([^<]*)<\/title>/m)[1]'`
    cat $file | ruby -e 'print STDIN.read.match(/<title>([^<]*)<\/title>/m)[1]'
    echo "    <p> <a href='${file}'>${title}</a> ${file} </p>" >> index.html
  fi
done

cat << TAIL >> index.html
  </body>
</html>
TAIL
