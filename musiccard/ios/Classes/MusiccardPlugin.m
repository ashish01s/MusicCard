#import "MusiccardPlugin.h"
#if __has_include(<musiccard/musiccard-Swift.h>)
#import <musiccard/musiccard-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "musiccard-Swift.h"
#endif

@implementation MusiccardPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMusiccardPlugin registerWithRegistrar:registrar];
}
@end
