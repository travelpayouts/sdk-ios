#  This file was automatically generated and should not be edited.
#
#  Copyright © 2024 CleverPumpkin. All rights reserved.
#
Pod::Spec.new do |s|
    s.name                  = 'WLSDK'
    s.version               = '1.3.0'
    s.summary               = 'Integrate flight search and booking framework in your apps.'
  
    s.description           = <<-DESC
    AviasalesKit iOS SDK is a framework integrating flights and hotels search engine into your app. When your user books a flight or hotel, you get paid. Framework is based on leading airline tickets and hotels search engines Aviasales.ru, Jetradar.com and Hotellook.com
                         DESC
  
    s.homepage              = 'https://github.com/travelpayouts/sdk-ios'
    s.license               = { :type => "Commercial" }
    s.author                = { 'Travelpayouts' => 'support@travelpayouts.com' }
    s.source                = { :git => 'https://github.com/travelpayouts/sdk-ios.git', :tag => s.version.to_s }
    s.swift_version         = '5.9'
    s.default_subspec       = 'Core', 'Flights', 'Hotels', 'Information'
    s.ios.deployment_target = '14.0'

    s.subspec 'Core' do |core|
        core.ios.vendored_frameworks = 'Vendor/Core/*.xcframework'

        core.dependency 'Apollo', '>= 1.9.3', '< 1.14.0'
        core.dependency 'AvailableHapticFeedback', '>= 1.0.4', '< 1.1.0'
        core.dependency 'ClusterKit', '>= 0.5.0', '< 1.0.0'
        core.dependency 'CombineCocoa', '>= 0.4.0', '< 1.0.0'
        core.dependency 'CombineExt', '>= 1.8.0', '< 2.0.0'
        core.dependency 'CrispyCalendar', '>= 1.0.10', '< 2.0.0'
        core.dependency 'DictionaryCoder', '>= 1.0.8', '< 2.0.0'
        core.dependency 'ImageViewer.swift', '>= 3.3.8', '< 3.4.0'
        core.dependency 'KeychainSwift', '>= 19.0.0', '<= 24.0.0'
        core.dependency 'Kingfisher', '>= 7.8.0', '< 8.0.0'
        core.dependency 'Moya/Combine', '>= 15.0.0', '< 16.0.0'
        core.dependency 'NeedleFoundation', '>= 0.17.2', '< 1.0.0'
        core.dependency 'Punycode-Cocoa', '>= 1.3.1', '< 2.0.0'
        core.dependency 'R.swift', '>= 7.2.4', '< 8.0.0'
        core.dependency 'SkeletonView', '>= 1.30.4', '< 2.0.0'
        core.dependency 'SnapKit', '>= 5.6.0', '< 6.0.0'
        core.dependency 'SweeterSwift', '>= 1.2.3', '< 1.3.0'
        core.dependency 'lottie-ios', '>= 4.2.0', '< 5.0.0'
    end

    s.subspec 'Flights' do |flights|
        flights.ios.vendored_frameworks = 'Vendor/Flights/*.xcframework'

        flights.dependency 'WLSDK/Core'
    end

    s.subspec 'Hotels' do |hotels|
        hotels.ios.vendored_frameworks = 'Vendor/Hotels/*.xcframework'

        hotels.dependency 'WLSDK/Core'
    end

    s.subspec 'Information' do |info|
        info.ios.vendored_frameworks = 'Vendor/Information/*.xcframework'

        info.dependency 'WLSDK/Core'
    end

    s.subspec 'WhiteLabelSupport' do |support|
        support.ios.vendored_frameworks = 'Vendor/WhiteLabelSupport/*.xcframework'

        support.dependency 'WLSDK/Core'
    end
end
