## libpddokdo (libPDDokdo)
This is a library to get weather which provides by iOS Weater.app easily for jailbroken devices.
** This library is only for 64-bit deivces. and will be available to download on Packix.**

## What is Dokdo?
Dokdo is a beautiful island in the east sea of Republic of Korea(South Korea).
For more information, visit [https://dokdo.mofa.go.kr/eng/]

## Methods
```objc
@interface PDDokdo : NSObject
-(NSString *)getCurrentTemperature;
-(NSString *)getCurrentConditions;
-(NSString *)getCurrentLocation;
-(UIImage *)getCurrentConditionsInImage;
-(NSDictionary *)weatherData;
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
As you can see the method above, `-(NSDictionary *)weatherData;` returns NSDictionary value.
```objc
//Example code
NSDictionary *weatherData = [[PDDokdo alloc] weatherData];

NSString *temperature = [weatherData objectForKey:@"temperature"];
NSString *condition = [weatherData objectForKey:@"condition"];
NSString *location = [weatherData objectForKey:@"location"];
UIImage *conditionsInImage = [weatherData objectForKey:@"conditionsImage"];
```

## How to get current temperature.
As you can see the method above, `-(NSString *)getCurrentTemperature;` returns NSString value.
```objc
//Example code
NSString *temperature = [[PDDokdo alloc] getCurrentTemperature];
```

## How to get current temperature.
As you can see the method above, `-(NSString *)getCurrentConditions;` returns NSString value.
```objc
//Example code
NSString *conditions = [[PDDokdo alloc] getCurrentConditions];
```

## How to get current temperature.
As you can see the method above, `-(NSString *)getCurrentLocation;` returns NSString value.
```objc
//Example code
NSString *location = [[PDDokdo alloc] getCurrentLocation];
```

## How to get current temperature.
As you can see the method above, `-(NSString *)getCurrentConditionsInImage;` returns NSString value.
```objc
//Example code
UIImage *conditionsInImage = [[PDDokdo alloc] getCurrentConditionsInImage];
```


## Special Thanks To
Special thanks to UBIK(@HiMyNameIsUbik) and Appie(@Baw_Appie) for helping me to make this library.