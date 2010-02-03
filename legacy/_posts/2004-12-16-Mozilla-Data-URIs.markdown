---
layout: post
title: "Mozilla Dat ..."
---
<h1>Mozilla Data URIs</h1>
(This post was autoconverted from the old news system,
it might look a little ... ugly until I find the time
to clean it up.
Sorry!)

    Just in case I'll ever have to recover a password from an old mozilla/firefox/firebird/phoenix file.
    
    Mozilla does support data URIs.
    Just strip the leading "~" and the trailing "==" from the login and password
    and you have base64 encoded data.
    
    Let Mozilla decode it:
    Enter
    data:;base64,WhAtEvEr
    in the location bar and hit enter.
    

