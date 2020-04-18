@interface PDDokdo : NSObject
-(NSString *)getCurrentTemperature;
-(NSString *)getCurrentConditions;
-(NSString *)getCurrentLocation;
-(UIImage *)getCurrentConditionsInImage;
-(NSDictionary *)weatherData;
@end