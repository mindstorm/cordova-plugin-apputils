cordova-plugin-app-utils
========================

Cordova AppUtils Plugin for Apache Cordova >= 3.0.0

## Installation

    cordova plugin add https://github.com/mindstorm/cordova-plugin-app-utils.git
    
## Utils

### IdleTimer

Enable / Disable the device sleep mode.

		$(document).on('deviceready', function () {

			// Enable the IdleTimer
			apputils.IdleTimer.enable(onSuccess, onError);
			// onSuccess = "OK"
			// onError = { code: 1, reason: "IdleTimer already enabled." }

			// Disable the IdleTimer
			apputils.IdleTimer.disable(onSuccess, onError);
			// onSuccess = "OK"
			// onError = { code: 1, reason: "IdleTimer already disabled." }

			// Get the IdleTimer Status
			apputils.IdleTimer.getStatus(onSuccess);
			// onSuccess = 0: disabled, 1: enabled

    });


### BundleInfo

Get the App Bundle Info.

		$(document).on('deviceready', function () {
			apputils.BundleInfo(onSuccess);
			/*
			 onSuccess = {
				"localeLanguage": <STRING>,
				"bundleBuild": <STRING>,
				"bundleVersion": <STRING>,
				"bundleId": <STRING>,
				"bundleDisplayName": <STRING>
			 }
			 automatic available under "apputils.info"
			*/
		});

### OpenWith

Open local files in an other app on the device.

### SocialShare

Social Share Function from the build-in Social.framework

## Version History

### 0.1.0 (2014-06)
* initial version
