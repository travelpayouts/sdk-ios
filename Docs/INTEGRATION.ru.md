# Интеграция SDK через CocoaPods

Travelpayouts SDK поставляется как зависимость CocoaPods из этого репозитория.
Если вы не используете CocoaPods, напишите на support@travelpayouts.com — мы
пришлём инструкцию по локальному подключению SDK.

> Гайд собран из подспеки (`WLSDK`, версия 1.7.0) и по соглашениям SDK.

> **Важно (миграция).** Поиск отелей удалён из SDK (API Hotellook отключён
> провайдером). Если в вашей интеграции использовались экраны или методы
> отелей — уберите их.

## Настройка Podfile

Включите сборку зависимостей в отдельные фреймворки:

```ruby
use_frameworks!
```

В хуке `post_install` установите `BUILD_LIBRARY_FOR_DISTRIBUTION = YES` для
зависимостей (так же настроена эталонная сборка White Label-приложения):

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

## Подключение SDK

Все модули по умолчанию (Core, Flights, Information):

```ruby
pod 'WLSDK', :git => 'https://github.com/travelpayouts/sdk-ios'
```

### Подключение модулей по отдельности

Авиабилеты (Flights):

```ruby
pod 'WLSDK/Flights', :git => 'https://github.com/travelpayouts/sdk-ios'
```

Модуль информации и настроек (Information):

```ruby
pod 'WLSDK/Information', :git => 'https://github.com/travelpayouts/sdk-ios'
```

## Пример Podfile

```ruby
use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '14.0'

travelpayouts_sdk_version = '1.7.0'
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

Задайте в `travelpayouts_sdk_version` версию SDK, которую вам выдали. Для работы
SDK также нужны персональный маркер и API-ключ — запросите их на
support@travelpayouts.com.
