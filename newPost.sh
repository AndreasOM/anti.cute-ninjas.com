#!/bin/sh

title=$1
postfile=_posts/`date -I`-${title}.markdown
touch _posts/`date -I`-${title}.markdown

echo "---" >$postfile
echo "layout: post" >>$postfile
echo "title: \"${title}\"" >>$postfile
echo "time: \"18:50\"" >>$postfile
echo "---" >>$postfile
echo "" >>$postfile

