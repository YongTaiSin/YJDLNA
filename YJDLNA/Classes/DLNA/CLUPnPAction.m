//
//  CLUPnPAction.m
//  DLNA_UPnP
//
//  Created by ClaudeLi on 16/10/10.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import "CLUPnPAction.h"
#import "CLXMLDocument.h"
#import "CLUPnP.h"

@interface CLUPnPAction (){
    NSString    *_action;
}
@property (nonatomic, strong) CLXMLDocument *XMLElement;

@end

@implementation CLUPnPAction

- (instancetype)initWithAction:(NSString *)action{
    self = [super init];
    if (self) {
        _action = action;
        _serviceType = CLUPnPServiceAVTransport;
        NSString *name = [NSString stringWithFormat:@"u:%@", _action];
        self.XMLElement = [CLXMLDocument elementWithName:name];
    }
    return self;
}

- (void)setServiceType:(CLUPnPServiceType)serviceType{
    _serviceType = serviceType;
}

- (void)setArgumentValue:(NSString *)value forName:(NSString *)name{
    CLXMLDocument *element = [CLXMLDocument elementWithName:name];
    [element setStringValue:value];
    [self.XMLElement addChild:element];
}

- (NSString *)getServiceType{
    if (_serviceType == CLUPnPServiceAVTransport) {
        return serviceType_AVTransport;
    }else{
        return serviceType_RenderingControl;
    }
}

- (NSString *)getSOAPAction{
    if (_serviceType == CLUPnPServiceAVTransport) {
        return [NSString stringWithFormat:@"\"%@#%@\"", serviceType_AVTransport, _action];
    }else{
        return [NSString stringWithFormat:@"\"%@#%@\"", serviceType_RenderingControl, _action];
    }
}

- (NSString *)getPostUrlStrWith:(CLUPnPDevice *)model{
    if (_serviceType == CLUPnPServiceAVTransport) {
        return [self getUPnPURLWithUrlModel:model.AVTransport urlHeader:model.URLHeader];
    }else{
        return [self getUPnPURLWithUrlModel:model.RenderingControl urlHeader:model.URLHeader];;
    }
}

- (NSString *)getUPnPURLWithUrlModel:(CLServiceModel *)model urlHeader:(NSString *)urlHeader{
    if ([[model.controlURL substringToIndex:1] isEqualToString:@"/"]) {
        return [NSString stringWithFormat:@"%@%@", urlHeader, model.controlURL];
    }else{
        return [NSString stringWithFormat:@"%@/%@", urlHeader, model.controlURL];
    }
}

/*
 <DIDL-Lite xmlns=\"urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:upnp=\"urn:schemas-upnp-org:metadata-1-0/upnp/\" xmlns:dlna=\"urn:schemas-dlna-org:metadata-1-0/\"><item id=\"0$1$1$17956\" parentID=\"parent\" restricted=\"1\"><dc:title>%s</dc:title><upnp:class>object.item.videoItem</upnp:class><res  protocolInfo=\"http-get:*:application/vnd.apple.mpegurl:*\">%s</res></item></DIDL-Lite>
 */

- (NSString *)getPostXMLFile{
    CLXMLDocument *xmlEle = [CLXMLDocument elementWithName:@"s:Envelope"];
    [xmlEle addAttribute:[CLXMLDocument attributeWithName:@"s:encodingStyle" stringValue:@"http://schemas.xmlsoap.org/soap/encoding/"]];
    [xmlEle addAttribute:[CLXMLDocument attributeWithName:@"xmlns:s" stringValue:@"http://schemas.xmlsoap.org/soap/envelope/"]];
    [xmlEle addAttribute:[CLXMLDocument attributeWithName:@"xmlns:u" stringValue:[self getServiceType]]];
    
    CLXMLDocument *command = [CLXMLDocument elementWithName:@"s:Body"];
    [command addChild:self.XMLElement];
    [xmlEle addChild:command];
    
    return xmlEle.XMLString;
}

@end
