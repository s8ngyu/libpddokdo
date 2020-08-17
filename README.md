## libpddokdo (libPDDokdo)
This is a library to get weather which provides by iOS Weather.app easily for jailbroken devices.
**This library is only for 64-bit deivces. and will be available to download on Packix.**
*PRs are appreciated!*

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
@property(nonatomic, strong, readonly) NSDate *sunrise;
@property(nonatomic, strong, readonly) NSDate *sunset;
@property (nonatomic, strong, readonly) NSDictionary *weatherData;
-(void)refreshWeatherData;
-(NSString *)highestTemperatureIn:(int)type;
-(NSString *)lowestTemperatureIn:(int)type;
@end
```

## What does it provide?
- Current temperature (ex. 14°)
- Current Conditions (ex. Mostly Cloudy)
- Current Location (ex. Gwanak-gu)
- Current Conditions In Image
- Today's sunrise time
- Today's sunset time
- Today's high temperature (ex. 24°)
= Today's low temperature (ex. 10°)

## How can I use it on my project?
Here is step by step guide how to use it on your project:
1. Clone or download this repository on your computer.
2. run `make clean stage`. This will install libpddokdo on your computer.
3. run `make do THEOS_DEVICE_IP=(your device ip)`. This will install libpddokdo on your iOS device.
4. Now, go to your project and open Makefile and add pddokdo, `$(TWEAK_NAME)_LIBRARIES += pddokdo`
5. Open control and add it as a dependency. `Depends: com.peterdev.libpddokdo`
6. Open Tweak.x(m) or wherever you want to use this library and add `#import <PeterDev/libpddokdo.h>` at the top of the source code to import libpddokdo.
7. Done. Follow below to learn how to get those values from libpddokdo.

## How to update libPDDokdo.
1. Clone or download this repository on your computer.
2. run `make clean stage`. This will install libpodokdo on your computer.
3. run `make do THEOS_DEVICE_IP=(your device ip)`. This will install libpddokdo on your iOS device.
4. Done. Check if documentation of libPDDokdo has been changed, and update your tweak.

## To get multiple values at once.
If you are going to get multiple values at once, **USE this method instead of methods below.**
As you can see the property above, `@property (nonatomic, strong, readonly) NSDictionary *weatherData;` is a NSDictionary.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSDictionary *weatherData = [[PDDokdo sharedInstance] weatherData];

NSString *temperature = [weatherData objectForKey:@"temperature"];
NSString *condition = [weatherData objectForKey:@"conditions"];
NSString *location = [weatherData objectForKey:@"location"];
UIImage *conditionsImage = [weatherData objectForKey:@"conditionsImage"];
NSDate *sunrise = [weatherData objectForKey:@"sunrise"];
NSDate *sunset = [weatherData objectForKey:@"sunset"];
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

## How to get current conditions image.
As you can see the property above, `@property (nonatomic, strong, readonly) UIImage *currentConditionsImage;` is an UIImage.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
UIImage *conditionsImage = [[PDDokdo sharedInstance] currentConditionsImage];
```

## How to get today's sunrise time.
As you can see the property above, `@property(nonatomic, strong, readonly) NSDate *sunrise;` is a NSDate.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSDate *sunrise = [[PDDokdo sharedInstance] sunrise];
```

## How to get today's sunset time.
As you can see the property above, `@property(nonatomic, strong, readonly) NSDate *sunset;` is a NSDate.
And you need to refresh weather data.
```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSDate *sunset = [[PDDokdo sharedInstance] sunset];
```

## How to get today's high temperature.
As you can see the method above, `-(NSString *)highestTemperatureIn:(int)type;` returns a NSString.
And you need to refresh weather data.

**types**
- 0: celsius
- 1: fahrenheit
- 2: kelvin

```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSString *highTemperature = [[PDDokdo sharedInstance] highestTemperatureIn:0];
```

## How to get today's low temperature.
As you can see the method above, `-(NSString *)lowestTemperatureIn:(int)type;` returns a NSString.
And you need to refresh weather data.

**types**
- 0: celsius
- 1: fahrenheit
- 2: kelvin

```objc
//Example code
[[PDDokdo sharedInstance] refreshWeatherData];
NSString *lowTemperature = [[PDDokdo sharedInstance] lowestTemperatureIn:0];
```

## Special Thanks To
Special thanks to UBIK(@HiMyNameIsUbik) and Appie(@Baw_Appie) for helping me to make this library.

Thanks to Janosch Hübner(@sharedRoutine) and John Zarogiannis(@johnzaro) for PRs.
