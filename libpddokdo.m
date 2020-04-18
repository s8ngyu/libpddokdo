#import "public/libpddokdo.h"
#import <objc/runtime.h>

@interface WAForecastModel : NSObject
-(NSDate *)sunrise;
-(NSDate *)sunset;
@end

@interface WALockscreenWidgetViewController : UIViewController
-(WAForecastModel *)currentForecastModel;
-(id)_temperature;
-(id)_conditionsLine;
-(id)_locationName;
-(id)_conditionsImage;
-(void)_updateTodayView;
-(void)updateWeather;
@end

@interface PDDokdo()
@property (nonatomic, retain, readonly) WALockscreenWidgetViewController *weatherWidget;
@end

@implementation PDDokdo
@dynamic currentTemperature;
@dynamic currentConditions;
@dynamic currentLocation;
@dynamic currentConditionsImage;
@dynamic sunrise;
@dynamic sunset;
@dynamic weatherData;
@synthesize weatherWidget = _weatherWidget;

+ (instancetype)sharedInstance {
	static dispatch_once_t p = 0;
	static __strong PDDokdo *_sharedSelf = nil;
	dispatch_once(&p, ^{
		_sharedSelf = [[PDDokdo alloc] init];
	});
	return _sharedSelf;
}

- (WALockscreenWidgetViewController *)weatherWidget {
	if (_weatherWidget) {
		return _weatherWidget;
	}
	_weatherWidget = [[objc_getClass("WALockscreenWidgetViewController") alloc] init];
	return _weatherWidget;
}

-(void)refreshWeatherData {
	if ([self.weatherWidget respondsToSelector:@selector(updateWeather)]) {
		[self.weatherWidget updateWeather];
	}
    if ([self.weatherWidget respondsToSelector:@selector(_updateTodayView)]) {
		[self.weatherWidget _updateTodayView];
	}
}

-(NSDictionary *)weatherData {
	NSMutableDictionary *data = [NSMutableDictionary dictionary];
	if (self.currentTemperature) [data setObject:self.currentTemperature forKey:@"temperate"]; else [data setObject:@"N/A" forKey:@"temperate"];
	if (self.currentConditions) [data setObject:self.currentConditions forKey:@"conditions"]; else [data setObject:@"N/A" forKey:@"conditions"];
	if (self.currentLocation) [data setObject:self.currentLocation forKey:@"location"]; else [data setObject:@"N/A" forKey:@"location"];
	if (self.sunrise) [data setObject:self.sunrise forKey:@"sunrise"];
	if (self.sunset) [data setObject:self.sunset forKey:@"sunset"];
	UIImage *currentConditionsImage = self.currentConditionsImage;
	if (currentConditionsImage) {
		[data setObject:currentConditionsImage forKey:@"conditionsImage"];
	}
	return data;
}

-(NSString *)currentTemperature {
	if ([self.weatherWidget respondsToSelector:@selector(_temperature)]) {
		return [self.weatherWidget _temperature];
	}
	return @"N/A";
}

-(NSString *)currentConditions {
	if ([self.weatherWidget respondsToSelector:@selector(_conditionsLine)]) {
		return [self.weatherWidget _conditionsLine];
	}
	return @"N/A";
}

-(NSString *)currentLocation {
	if ([self.weatherWidget respondsToSelector:@selector(_locationName)]) {
		return [self.weatherWidget _locationName];
	}
	return @"N/A";
}

-(UIImage *)currentConditionsImage {
	if ([self.weatherWidget respondsToSelector:@selector(_conditionsImage)]) {
		return [self.weatherWidget _conditionsImage];
	}
	return NULL;
}

-(NSDate *)sunrise {
	if ([self.weatherWidget respondsToSelector:@selector(currentForecastModel)]) {
		if([self.weatherWidget currentForecastModel]) {
			return [[self.weatherWidget currentForecastModel] sunrise];
		}
	}
	return NULL;
}

-(NSDate *)sunset {
	if ([self.weatherWidget respondsToSelector:@selector(currentForecastModel)]) {
		if([self.weatherWidget currentForecastModel]) {
			return [[self.weatherWidget currentForecastModel] sunset];
		}
	}
	return NULL;
}

@end