/**
 * CDVBundleInfo.js
 *  
 * Cordova AppInfoGap Instance plugin
 * Copyright (c) Chris Stoll 2012
 *
 */

var BundleInfo = {revision : "", build : "", bundleDisplayName:"", bundleIconUri:"", bundleIdentifier:""};

var CDVBundleInfo = {
    
    set_values : function (value) {
       // console.log(value);
        BundleInfo = JSON.parse(value);
        //BundleInfo.bundleIconUri = "data:image/png;base64," + BundleInfo.bundleIconUri;
        //console.log(BundleInfo.bundleDisplayName);
        BICallBack();
    },
    
    set_error : function (value) {
        //console.log(value);
        //var js = JSON.parse(value);
        //this.build = js.build;
        //this.revision = js.revision;
        
        //return this;
        
    },
    
    init : function () {
        var types=[];
        cordova.exec(this.set_values, this.set_error, "CDVBundleInfo", "getVersion", types);
    }
   
};


