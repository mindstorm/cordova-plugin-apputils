/* global require, module */

var exec = require("cordova/exec");

var AppUtils = function () {
    this.name = "AppUtils";
};

// IdleTimer
AppUtils.prototype.IdleTimer = {
    enable: function (onSuccess, onError) {
        var options = {
            "action": "enable"
        };
        exec(onSuccess, onError, "AppUtils", "IdleTimer", [options]);
    },
    disable: function (onSuccess, onError) {
        var options = {
            "action": "disable"
        };
        exec(onSuccess, onError, "AppUtils", "IdleTimer", [options]);
    },
    status: function (onSuccess, onError) {
        var options = {
            "action": "status"
        };
        exec(onSuccess, onError, "AppUtils", "IdleTimer", [options]);
    }
};

// BundleInfo
AppUtils.prototype.BundleInfo = function (onSuccess, onError) {
    exec(onSuccess, onError, "AppUtils", "BundleInfo", []);
};

module.exports = new AppUtils();