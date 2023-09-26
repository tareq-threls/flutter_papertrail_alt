#import "FlutterPaperTrailAltPlugin.h"
#import <flutter_papertrail_alt/flutter_papertrail_alt-Swift.h>

@implementation FlutterPaperTrailAltPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPaperTrailAltPlugin registerWithRegistrar:registrar];
}
@end
