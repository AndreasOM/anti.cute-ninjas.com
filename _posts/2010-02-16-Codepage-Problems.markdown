---
layout: post
title: "Codepage Problems"
time: "18:50"
---

While trying to get LSI running for related posts,
I stumbled over jekyll crashing when converting certain files.

In the end it was some wrong characters inside my posts.

The old posts from wordpress were encoded in ISO-8859-1
and an &auml; (E4) resulted in bad UTF-8 which jekyll expected.

The quick fix:
{% highlight bash %}
  find . -name "*.markdown" -exec iconv -f ISO-8859-1 -t UTF-8 {} -o {}.new \;
  find . -name "*.markdown" -exec mv {}.new {} \;
{% endhighlight %}

I might better get busy fixing jekyll to not crash and just ignore invalid characters though.

