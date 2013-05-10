#!/bin/sh

title=$1
cleantitle=${title//[ .]/_}
echo $cleantitle
d=`date "+%Y-%m-%d"`
postfile=_posts/${d}-${cleantitle}.markdown

if [ ! -f "${postfile}" ]
then

touch ${postfile}

echo "---" >$postfile
echo "layout: post" >>$postfile
echo "title: \"${title}\"" >>$postfile
echo "time: \"18:50\"" >>$postfile
echo "---" >>$postfile
echo "" >>$postfile

else
	echo "ERROR: ${postfile} already exists."
fi

