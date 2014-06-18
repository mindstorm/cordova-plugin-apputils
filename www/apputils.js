var exec = require("cordova/exec");

var AppUtils = function () {
	this.name = "AppUtils";
};

AppUtils.prototype.IdleTimer.enable = function (onSuccess, onError) {
	exec(onSuccess, onError, "AUIdleTimer", "enable", []);
};

AppUtils.prototype.IdleTimer.disable = function (onSuccess, onError) {
	exec(onSuccess, onError, "AUIdleTimer", "disable", []);
};

module.exports = new AppUtils();