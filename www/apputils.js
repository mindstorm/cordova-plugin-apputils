/* global require, module */

var exec = require("cordova/exec"),
	channel = require('cordova/channel'),
	utils = require('cordova/utils');

channel.createSticky('onAppUtilsReady');
// Tell cordova channel to wait on the AppUtilsReady event
channel.waitForInitialization('onAppUtilsReady');

var AppUtils = function () {
	var me = this;

	me.name = "AppUtils";
	me.version = "0.1.0";

	channel.onCordovaReady.subscribe(function () {
		me.BundleInfo(function (info) {
			me.info = info;
			channel.onAppUtilsReady.fire();
		}, function (e) {
			me.info = false;
			utils.alert("[ERROR] Error initializing Cordova: " + e);
		});
	});

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
	getStatus: function (onSuccess) {
		var options = {
			"action": "status"
		};
		exec(onSuccess, null, "AppUtils", "IdleTimer", [options]);
	}
};

// BundleInfo
AppUtils.prototype.BundleInfo = function (onSuccess) {
	exec(onSuccess, null, "AppUtils", "BundleInfo", []);
};

// OpenWith
AppUtils.prototype.OpenWith = function (onSuccess, onError, options) {
	exec(onSuccess, onError, "AppUtils", "OpenWith", [options]);
};

// SocialShare
AppUtils.prototype.SocialShare = function (onSuccess, onError, options) {
	exec(onSuccess, onError, "AppUtils", "SocialShare", [options]);
};

module.exports = new AppUtils();