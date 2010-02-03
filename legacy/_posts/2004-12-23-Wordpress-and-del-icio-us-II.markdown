---
layout: post
title: "Wordpress a ..."
---
<h1>Wordpress and del.icio.us II</h1>
(This post was autoconverted from the old news system,
it might look a little ... ugly until I find the time
to clean it up.
Sorry!)

    OK.
    The publish_post only gets the post id when the priority is lower than that of generic_ping (10),
    since that hook is buggy.
    
    Should be better now.
    
    <div class="edit">
    get_permalink( ) was the magic function :)
    </div>
    <div class="edit">
    ezSQL is your friend.
    And get_results is better than get_var when getting more than one result ;)
    </div>

