WWT
===========

This is the beginnings of a gem to control Microsoft's word wide telescope from Ruby. It currently focuses on the desktop client

Features
--------

Control of pointing of telescope.
Earthquake like notifications

Connecting to WWT 
-----------------
Connecting to a WWT instance is as simple as `WWT.new`. This defaults to connecting to *http://0.0.0.0:5050*.
You can also pass in a url and port if needed with `WWT.new url, port ` 
Once connected you will get back an instance of `WWTClient` which allows you to pass commands off to WWT. 
	
Selecting WWT mode 
------------------
You can select the current mode by `WWTClient.look_at thing` where thing can be "Earth", "Sky", "SolarSystem" etc
		
Incremental movements 
--------------------

You can make the telescope move incrementally (the equivalent of pressing keys in the GUI interface) using `WWTClient.move motion` where motion can be ["Left", "Right", "Up", "Down", "Clockwise", "CounterClockwise",]
		
Layers 
------

We support the creation of layers within the WWT framework using `layer=WWTClient.new_layer :frame=>frame, :name=>name, :data=>['ra','dec','time']` where frame is the frame this layer is sent to and name is a name given to a layer and data tells us what type of data this layer is going to show. This returns an instance of WWT_layer which allows access to that layer. There are many other options that can be passed in through the hash for a full list look at http://www.worldwidetelescope.org/Docs/WorldWideTelescope_lcapi.html. 
		
Updating
--------

We can push data to the layer for visulisation with `layer.update :data=>["10","10",'02/03/1999 10:20:33]` 
			
Properties
---------- 

Any property of the later can be gotten by `later.property_with_underscores` for example in the WWT documentation (http://www.worldwidetelescope.org/Docs/WorldWideTelescope_lcapi.html#Table_of_Properties) we have "EndTime" to get this we would call layer.end_time and to set it `layer.end_time=`

Requirements
------------

You will need to have an install of WWT on your machine or another machine with port 5050 open. This is where WWT listens to. You also need to have the IP of controlling machine enabled in the list of approved sources in WWT.

Install
-------

gem install WWT

Author
------

Original author: Stuart Lynn

Contributors:


License
-------

(The MIT License) FIXME (different license?)

Copyright (c) 2011 FIXME (author's name)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
