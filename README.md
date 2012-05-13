AppInfoGap
==========

A simple cordova IOS plugin for getting the Version number and Build number from XCode settings.

Often in a cordova app, you want to have an "about" type screen, or a copyright string with version and build number. Remembering to update the build number in XCode and in your HTML/Javascript is whack, so I did this to get the ball rolling.  It lets you grab those values and use them in your javascript... voila, guaranteed accurate revision/build numbers in your Javascript/HTML.


Installation:

1. Drag "AppInfoGap.m" and "AppInfoGap.h" into your "Plugins" folder in the XCode Project navigator.
2. Add an entry to the Cordova.plist "plugins" section, put "AppInfoGap" in for the key and the value.
3. Copy "appinfogap.js" into your www folder and reference it in your HTML.

To Use AppInfoGap:

1. in the OnDeviceReady event, add this code: "AppInfo.init();"
2. add a function to your javascript called "AICallBack". 
3. write code in this function to place the values in your HTML. Once you are in this function, the async cordova code has run, and has loaded the plist version and build values into a global object called "Version".  This object has two properties, "revision" and "build".  You can access them by referring to Version.revision and Version.build in your javascript code. 
4. you can also reference the Version object in your user events, or any other time after the AICallBack function has been called by the plugin.

RoadMap:

1. Make it more proper, optimize/streamline client-app interface.
2. Add more plist info to more objects/properties (i.e. Icons.small, Icons.2x, Options.blah, Whatever.etc...)
3. Get it included with cordova by default, cuz it really should be there.
=======
A simple cordova IOS plugin for getting the Version number and Build number from XCode settings.

