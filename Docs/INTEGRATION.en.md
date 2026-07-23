# Integrating the SDK via CocoaPods

The Travelpayouts SDK is distributed as a CocoaPods dependency from this
repository. If you do not use CocoaPods, write to support@travelpayouts.com and
we will send you instructions for integrating the SDK locally.

> This guide was assembled from the podspec (`WLSDK`, version 1.8.0) and the
> SDK's conventions.

> **Important (migration).** Hotel search has been removed from the SDK (the
> Hotellook API was shut down by the provider). If your integration used hotel
> screens or methods, remove them.

## Configure your Podfile

Enable building dependencies as separate frameworks:

```ruby
use_frameworks!
```

In the `post_install` hook, set `BUILD_LIBRARY_FOR_DISTRIBUTION = YES` for the
dependencies (this matches the reference White Label app build):

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

## Add the SDK

All default modules (Core, Flights, Information):

```ruby
pod 'WLSDK', :git => 'https://github.com/travelpayouts/sdk-ios'
```

### Adding modules separately

Flights:

```ruby
pod 'WLSDK/Flights', :git => 'https://github.com/travelpayouts/sdk-ios'
```

Information and Settings module:

```ruby
pod 'WLSDK/Information', :git => 'https://github.com/travelpayouts/sdk-ios'
```

## Sample Podfile

```ruby
use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '14.0'

travelpayouts_sdk_version = '1.8.0'
travelpayouts_sdk_source = 'https://github.com/travelpayouts/sdk-ios'

target 'MyApplication' do
  pod 'WLSDK', :git => travelpayouts_sdk_source, :tag => travelpayouts_sdk_version
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end
```

Set `travelpayouts_sdk_version` to the SDK version you were given. To use the
SDK you also need a personal marker and API key — request them at
support@travelpayouts.com.
