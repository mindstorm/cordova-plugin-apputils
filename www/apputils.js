var exec = require("cordova/exec");

var AppUtils = function () {
    this.name = "AppUtils";
};

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
    }
};

module.exports = new AppUtils();