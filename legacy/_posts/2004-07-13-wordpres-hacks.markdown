---
layout: post
title: "wordpres hacks"
---
<h1>wordpres hacks</h1>
(This post was autoconverted from the old news system,
it might look a little ... ugly until I find the time
to clean it up.
Sorry!)

    Inspired by this
    <a href="http://weblog.burningbird.net/archives/2004/05/26/did-the-port-thing/">Did The Port Thing</a>
    
    I'll add "by post moderation" to my wordpress.
    
    Step 1:
    Alter the database
    mysql> alter table wp_posts modify comment_status enum('open','closed','registered_only','moderated');
    
    Step 2:
    Edit wp-comments.php
    Replace
    < ?php if ('open' == $post->comment_status) { ?>
    with
    < ?php if ($post->comment_status =='open' || $post->comment_status == 'moderated' ) { ?>
    
    In my case this had to be done twice.
    
    After
    < a href="#postcomment" title="<?php _e("Leave a comment"); ?>">&raquo;
    (just below)
    add
    < ?php if ($post->comment_status=='moderated') echo("Comments on this post are moderated. Wait patiently until it's approved"); ?>
    
    Step 3:
    Edit wp-comments-post.php
    Replace
    if ( closed == $wpdb->get_var("SELECT comment_status FROM $tableposts WHERE ID = $comment_post_ID") )
    die( __(Sorry, comments are closed for this item.) );
    with
    $commentstatus = $wpdb->get_var("SELECT comment_status FROM $tableposts WHERE ID = $comment_post_ID");
    if ('closed' == $commentstatus)
    die('Sorry, comments are closed for this item.');
    
    Find
    $wpdb->query("INSERT INTO $tablecomments
    (comment_post_ID, comment_author, comment_author_email, comment_author_url, comment_author_IP, comment_date, comment_date_gmt, comment_
    content, comment_approved)
    VALUES
    ('$comment_post_ID', '$author', '$email', '$url', '$user_ip', '$now', '$now_gmt', '$comment', '$approved')
    ");
    and insert <strong>before</strong>
    if ($commentstatus == 'moderated') {
    $moderation_notify = true;
    $approved = 0;
    }
    else
    $approved = 1;
    
    OK,
    now we have per post moderation options, but the only way to enable them is to hack the database ;)
    update wp_posts set comment_status='moderated' where id=99;
    
    
    

