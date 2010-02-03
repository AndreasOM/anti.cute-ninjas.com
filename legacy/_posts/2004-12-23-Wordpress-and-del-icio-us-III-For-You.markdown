---
layout: post
title: "Wordpress a ..."
---
<h1>Wordpress and del.icio.us III - For You</h1>
(This post was autoconverted from the old news system,
it might look a little ... ugly until I find the time
to clean it up.
Sorry!)

    OK,
    here it is in all its glory ;)
    
    1. Put <a href="http://anti.cute-ninjas.com/downloads/antis-deliciousiser.phps">the plugin</a> into your plugins directory.
    2. Set the DEL_USER and DEL_PASS.
    3. Put the <a href="http://dietrich.ganx4.com/delicious/">delicious php class</a> into your plugins/includes directory.
    4. Activate the plugin.
    
    Let me know if it doesn't work.
    Or if you have any improvements.
    
    [php]
    /*
    Plugin Name:  Deliciousizer
    Version: 0.1
    Plugin URI: http://anti.cute-ninjas.com/
    Description: Post new posts to del.icio.us
    Author: Andreas Neukoetter
    Author URI: http://anti.cute-ninjas.com/
    */
    
    $DEL_USER="YES";
    $DEL_PASS="SURE";
    
    require_once('includes/class.delicious.php');
    
    function delicious_add( $user, $pass, $link, $title, $tag )
    {
            //$url = "http://$USER:$PASS@del.icio.us/api/posts/add?url=$link&description=$title&tags=$tags";
            $del = new delicious( $user, $pass );
            $now = strftime( "%C%y-%m-%dT%H:%M-%S" );
            $del->add_post( $link, $title, "", $tag, $now );
    
    }
    function post_to_delicious( $id )
    {
            global $wpdb, $tableposts, $tablepost2cat, $tablecategories;
            global $DEL_USER, $DEL_PASS;
    
            $post_title = $wpdb->get_var("SELECT post_title FROM $tableposts WHERE ID=$id;");
            $title = "Anti's Blog [".$id."] - ".$post_title;
            $tags = "[wp-anti] [wp-$id] blog";
    
            $post_cats = $wpdb->get_results( "SELECT category_id FROM $tablepost2cat WHERE post_id=$id;" );
            foreach( $post_cats as $post_cat ){
                    $post_cat_title = $wpdb->get_var("SELECT cat_name FROM $tablecategories WHERE cat_ID=".$post_cat->category_id.";");
                    $tags = $tags." ".$post_cat_title;
            }
            $link = get_permalink( $id );
    
            delicious_add( $DEL_USER, $DEL_PASS, $link, $title, $tags );
    
            return( $id );
    }
    
    add_action( 'edit_post', 'post_to_delicious',9 );
    add_action( 'publish_post', 'post_to_delicious',9 );
    [/php]
    
    BTW:
    Thanks to Daryl for <a href="http://daryl.learnhouston.com/index.php?cat=21">PHPizer</a>
    

