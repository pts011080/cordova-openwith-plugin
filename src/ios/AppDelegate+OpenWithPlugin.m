#import "AppDelegate+OpenWithPlugin.h"
#import "OpenWithPlugin.h"
#import <objc/runtime.h>

@implementation AppDelegate (OpenWithPlugin)

- (void)applicationDidBecomeActive:(UIApplication *)application{
     OpenWithPlugin *openWithHandler = [self.viewController getCommandInstance:@"OpenWithPlugin"];
    
    [openWithHandler setup];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSLog(@"url received!");

    if ([[url host] isEqualToString:@"shareextension"]){
        OpenWithPlugin *openWithHandler = [self.viewController getCommandInstance:@"OpenWithPlugin"];
   
        [openWithHandler handleFilesReceived:nil];
    }else{
        NSLog(@"url scheme launch App!");
    }
        
    return true;
}

@end
