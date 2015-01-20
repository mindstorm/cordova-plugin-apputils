cordova-plugin-apputils
========================

Cordova AppUtils Plugin for Apache Cordova >= 3.0.0

## Installation

    cordova plugin add https://github.com/mindstorm/cordova-plugin-apputils.git
    
## AppUtils

### IdleTimer

Enable / Disable the device sleep mode.

		// Enable the IdleTimer
		apputils.IdleTimer.enable(onSuccess, onError);
		/*
			onSuccess:
				"OK"
			onError:
				{ code: 1, reason: "IdleTimer already enabled." }
		*/

		// Disable the IdleTimer
		apputils.IdleTimer.disable(onSuccess, onError);
		/*
			onSuccess:
				"OK"
			onError:
				{ code: 1, reason: "IdleTimer already disabled." }
		*/

		// Get the IdleTimer Status
		apputils.IdleTimer.getStatus(onSuccess);
		/*
			onSuccess:
				0 = disabled
				1 = enabled
		*/

### BundleInfo

Get the App Bundle Info.

		apputils.BundleInfo(onSuccess);
		/*
			onSuccess:
				{
					"localeLanguage": <STRING>,
					"bundleBuild": <STRING>,
					"bundleVersion": <STRING>,
					"bundleId": <STRING>,
					"bundleDisplayName": <STRING>
				}
				automatic available under "apputils.info"
		*/

### OpenWith

Open local files in an other app on the device.

		apputils.OpenWith(onSuccess, onError, options);
		/*
			onSuccess:
				"OK"
			onError:
				{ code: 1, reason: "Empty URL." }
				{ code: 2, reason: "URL not found." }
				{ code: 3, reason: "Unknown filetype." }
			options:
				{
                    annotation: <MAP>,
					url: <STRING>,
                    uti: <STRING>,
					left: <INT>,
					top: <INT>,
					width: <INT>,
					height: <INT>
				}
		*/

### SocialShare

Social Share Function from the build-in Social.framework

		apputils.SocialShare(onSuccess, onError, options);
		/*
			onSuccess:
				"OK"
			onError:
				{ code: 1, reason: "Empty parameter." }
				{ code: 2, reason: "File not found." }
			options:
				{
					text: <STRING>,
					url: <STRING>,
					left: <INT>,
					top: <INT>,
					width: <INT>,
					height: <INT>,
					excluded: <INT ARRAY>
				}
				text or url: required
				left, top, width and height: optional, when defined: popover presentation style else: modal presentation style
				excluded: 1: Facebook, 2: Twitter, 3: Weibo, 4: Message, 5: Mail, 6: Print, 7: Copy to Pasteboard, 8: Assign To Contact, 9: Save to Camera Roll
		*/

## Supported Platforms
iOS

## Version History

### 0.1.0 (2014-06)
* initial version
