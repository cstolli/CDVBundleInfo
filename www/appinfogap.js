/**
 * AppInfoGap.js
 *  
 * Cordova AppInfoGap Instance plugin
 * Copyright (c) Chris Stoll 2012
 *
 */

var Version = {revision : "", build : ""};

var AppInfo = {
    
    set_values : function (value) {
        //console.log(value);
        var js = JSON.parse(value);
        Version.build = js.build;
        Version.revision = js.revision;
       //console.log(r);
        //console.log(Version.build);
        AICallBack(js);
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
        cordova.exec(this.set_values, this.set_error, "AppInfoGap", "getVersion", types);
    }
   
};


