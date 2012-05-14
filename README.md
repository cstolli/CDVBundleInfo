CDVBundleInfo
=============

A simple cordova IOS plugin for getting the App Icon (as base64 data uri!), launch image (also datauri!), bundle display name, bundle id, version number, and build number from XCode settings, and using them in Javascript/HTML to make your app's very official looking about page.  Never worry about updating those values or including those graphic assets again!


Provides the Following plist values:
-----------------------------------
1. BundleInfo.bundleId; -> Bundle ID (com.whatever.yup)
2. BundleInfo.bundleDisplayName; -> Bundle Display Name (what it will say under your icon in iOS)
3. BundleInfo.version;
4. BundleInfo.build;
5. BundleInfo.bundleIconUri; -> APP ICON!!! -> now gets app icon as base64 data URI so you can display it on your about page all official like.  I even threw in some CSS for the gloss effect if you wanna overlay that.
6. BundleInfo.bundlePhoneLaunchImage; -> Retina-sized launch image (Default@2x~iphone.png) as data URI as well, so can make your own splashes that mimic your app's native splash without re-including the splash image in your www directory - save precious space getting under the 20 MB cellular install limit.


Installation:
------------
1. Drag "CDVBundleInfo.m" and "CDVBundleInfo.h" into your "Plugins" folder in the XCode Project navigator.
2. Add an entry to the Cordova.plist "plugins" section, put "CDVBundleInfo" in for the key and the value.
3. Copy "cdvbundleinfo.js" into your www folder and reference it in your HTML.


To Use CDVBundleInfo:
-----------------
1. in the OnDeviceReady event, add this code: "CDVBundleInfo.init();"
2. add a function to your javascript called "BICallBack". 
3. write code in this function to place the values in your HTML. Once you are in this function, the async cordova code has run, and has loaded the plist version and build values into a global object called "BundleInfo". Reference it in your code as mentioned above.
4. you can also reference the BundleInfo object in your user events, or any other time after the AICallBack function has been called by the plugin.


To Improve CDVBundleInfo:
---------------------
1. just clonefork the repo to your gitnode rubygem and start coding.  seriously just pull this whole pile, open it in xcode, start coding.  ping me or notify me or whatever the f you do so I can add you for merges to the branchtrunk code tree.


RoadMap:
-------
0. CHANGE NAME: BundleInfo, CDVBundleInfo, CDVPList, idk.  taking suggestions.
1. Make it more proper, optimize/streamline client-app interface.  My obj-oriented javascript is limited to my JSON knowledge really.  Not sure of smoothest way to flatten this out.  
2. IDEAL INTERFACE:  var myBundleInfo = new BundleInfo(); alert(myBundleInfo.version;), etc.. I don't know JS well enough to figure out how to do this.  Async hell.
3. Add more plist info to more objects/properties (i.e. Icons.small, Icons.2x, Options.blah, Whatever.etc...)
4. Improve possible expanded object model
5. Get it included with cordova by default, cuz it really should be there.


Changlog:
--------
Mother's Day 2012 - after TCB, added bundle id, bundle display name, and BASE 64 APP ICON!!! sick.


