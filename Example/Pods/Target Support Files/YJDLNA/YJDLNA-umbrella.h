#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CLUPnP.h"
#import "CLUPnPAction.h"
#import "CLUPnPAVPositionInfo.h"
#import "CLUPnPDevice.h"
#import "CLUPnPRenderer.h"
#import "CLUPnPResponseDelegate.h"
#import "CLUPnPServer.h"
#import "CLXMLDocument.h"
#import "CLXMLParser.h"
#import "StopAction.h"
#import "YJDLNA.h"

FOUNDATION_EXPORT double YJDLNAVersionNumber;
FOUNDATION_EXPORT const unsigned char YJDLNAVersionString[];

