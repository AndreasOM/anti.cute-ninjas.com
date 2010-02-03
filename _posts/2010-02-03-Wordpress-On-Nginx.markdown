---
layout: post
title: Wordpress On Nginx
time: "14:33"
---

Yesterday evening I setup a new server for the website of a friend.  
He doesn't know a lot about the technical site of the internet,  
so I had planned to give him the usual  
LAMP (Linux, Apache, MySQL, PHP) + Wordpress setup.

Having played with Nginx with Phusion Passenger support last week,  
I decided to have a little experiment with this clean new box,  
that nobody would need before next week.

So instead of installing Apache I went with Nginx.  

The setup was ultra easy:

* gem install passenger
* passenger-install-nginx-module
* install spawn-fcgi
* configure nginx

After this I only had to do the [Famous 5-Minute Install](http://codex.wordpress.org/Installing_WordPress#Famous_5-Minute_Install)
and I was done.

Result?

* The system does everything it is suppossed to.
* The responses "feel" a lot faster than from my other servers.
* The system load is a lot lower.
* Memory consumption went down to nearly zero.

I think I'll just leave this system as is to get some long term experience.

Next stop?

Remove the *toy* MySQL from the equation and replace with a real database system (e.g. PostgreSQL).


