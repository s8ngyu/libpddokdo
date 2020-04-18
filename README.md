## libpddokdo (libPDDokdo)
This is a library to get weather which provides by iOS Weater.app easily for jailbroken devices.
** This library is only for 64-bit deivces. and will be available to download on Packix.**

## What is Dokdo?
Dokdo is a beautiful island in the east sea of Republic of Korea(South Korea).
For more information, visit [https://dokdo.mofa.go.kr/eng/]

## Methods
```objc
@interface PDDokdo : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic, copy, readonly) NSString *currentTemperature;
@property (nonatomic, copy, readonly) NSString *currentConditions;
@property (nonatomic, copy, readonly) NSString *currentLocation;
@property (nonatomic, strong, readonly) UIImage *currentConditionsImage;
@property (nonatomic, strong, readonly) NSDictionary *weatherData;
- (void)refreshWeatherData;
@end
```

## What does it provide?
- Current temperature (ex. 14°)
- Current Conditions (ex. Mostly Cloudy)
- Current Location (ex. Gwanak-gu)
- Current Conditions In Image

## How can I use it on my project?
Here is step by step guide how to use it on your project:
1. Clone or Download this repository on your computer.
2. run `make clean stage`. This will install libpddokdo on your computer.
3. run `make do THEOS_DEVICE_IP=(your device ip)`. This will install libpddokdo on your iOS device.
4. Now, go to your project and open Makefile and add pddokdo, `$(TWEAK_NAME)_LIBRARIES += pddokdo`
5. Open control and add it as a dependency. `Depends: com.peterdev.libpddokdo`
6. Open Tweak.x(m) or wherever you want to use this library and add `#import <PeterDev/libpddokdo.h>` at the top of the source code to import libpddokdo.
7. Done. Follow below to learn how to get those values from libpddokdo.

## To get multiple values at once.
If you are going to get multiple values at once, **USE this method instead of methods below.**
As you can see the property above, `@property (nonatomic, strong, readonly) NSDictionary *weatherData;` is a NSDictionary.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSDictionary *weatherData = [[PDDokdo sharedInstance] weatherData];

NSString *temperature = [weatherData objectForKey:@"temperature"];
NSString *condition = [weatherData objectForKey:@"condition"];
NSString *location = [weatherData objectForKey:@"location"];
UIImage *conditionsInImage = [weatherData objectForKey:@"conditionsImage"];
```

## How to get current temperature.
As you can see the property above, `@property (nonatomic, copy, readonly) NSString *currentTemperature;` is a NSString.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSString *temperature = [[PDDokdo sharedInstance] currentTemperature];
```

## How to get current conditions.
As you can see the property above, `@property (nonatomic, copy, readonly) NSString *currentConditions;` is a NSString.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSString *conditions = [[PDDokdo sharedInstance] currentConditions];
```

## How to get current location.
As you can see the property above, `@property (nonatomic, copy, readonly) NSString *currentLocation;` is a NSString.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSString *location = [[PDDokdo sharedInstance] currentLocation];
```

## How to get current conditionsImage.
As you can see the property above, `@property (nonatomic, strong, readonly) UIImage *currentConditionsImage;` is an UIImage.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
UIImage *conditionsImage = [[PDDokdo sharedInstance] currentConditionsImage];
```


## Special Thanks To
Special thanks to UBIK(@HiMyNameIsUbik), Appie(@Baw_Appie) and Janosch Hübner(@sharedRoutine) for helping me to make this library.