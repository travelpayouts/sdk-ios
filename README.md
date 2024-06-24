# Travelpayouts SDK

Create your own iOS app for searching tickets and hotels or integrate the SDK into your travel app and earn commissions from sales through the app.

[Travelpayouts.com](Travelpayouts.com)

[What is Travelpayouts?](https://support.travelpayouts.com/hc/en-us/articles/203955593-What-is-Travelpayouts-and-how-does-it-work)

Integration of the SDK is possible via CocoaPods. If you do not use this dependency manager, please contact us at support@travelpayouts.com, and we will send you information on how to connect the Travelpayouts SDK locally.


# Integrating Travelpayouts SDK iOS via CocoaPods

To integrate the SDK into your project, you need to modify your `Podfile` as follows:

- Enable building dependencies into separate frameworks:
  ```ruby
  use_frameworks!
  ```
- In the post-install hook, set `BUILD_LIBRARY_FOR_DISTRIBUTION = YES` for dependencies:
  ```ruby
  post_install do |installer|
  	installer.pods_project.targets.each do |target|
  		target.build_configurations.each do |config|
  			config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
  			config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
  		end
  	end
  end
  ```

## Integrating Modules
- Flights
  ```ruby
  pod 'WLSDK/Flights'
  ```
- Hotel Booking
  ```ruby
  pod 'WLSDK/Hotels'
  ```
- Information and Settings Module
  ```ruby
  pod 'WLSDK/Information'
  ```

## Sample Podfile
```ruby
use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '14.0'

target 'MyApplication' do
  pod 'WLSDK/Hotels', '1.2.0'
  pod 'WLSDK/Flights', '1.2.0'
end

# Various post-install hooks
post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
			config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
		end
	end
end
```
