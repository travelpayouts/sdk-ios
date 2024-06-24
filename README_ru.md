# Travelpayouts SDK

Создайте собственное iOS–приложение для поиска билетов и отелей или подключите SDK в ваше Travel-приложение и получайте комиссию от продаж через приложение.

[Travelpayouts.com](Travelpayouts.com)

[What is Travelpayouts?](https://support.travelpayouts.com/hc/en-us/articles/203955593-What-is-Travelpayouts-and-how-does-it-work)

Подключения SDK возможно через CocoaPods. Если вы не используете этот менеджер зависимостей напишите нам на support@travelpayouts.com и мы пришлем информацию как подключить Travelpayouts SDK локально


# Подключение Travelpayouts SDK iOS через CocoaPods

Для подключения SDK к вашему проекту необходиомо модифицировать ваш `Podfile` следующим образом:
- Включить сборку зависимостей в отдельные фреймворки
  ```ruby
  use_frameworks!
  ```
- В коде постобработчика задать настроку `BUILD_LIBRARY_FOR_DISTRIBUTION = YES`, для зависимостей
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

## Подключение модулей
- Авиабилеты
  ```ruby
  pod 'WLSDK/Flights'
  ```
- Бронирование отелей
  ```ruby
  pod 'WLSDK/Hotels'
  ```
- Модуль с информацией и настройками
  ```ruby
  pod 'WLSDK/Information'
  ```

## Пример Podfile
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
