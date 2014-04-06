//
//  BUNAppDelegate.m
//  qcInCocoa
//
//  Created by minibun on 08/03/2014.
//  Copyright (c) 2014 minibun. All rights reserved.
//

#import "BUNAppDelegate.h"

@implementation BUNAppDelegate
@synthesize windowForParameters;

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    myQCView = [[QCView alloc] initWithFrame:NSInsetRect([self.window.contentView frame], 10, 10)];
    [self.window.contentView addSubview:myQCView];
    
    if (![myQCView loadCompositionFromFile:[[NSBundle mainBundle] pathForResource:@"demo" ofType:@"qtz"]])
    {
        NSLog(@"ERROR : No QTZ composition loaded");
    }
    [myQCView startRendering];
     
    
    [myQCView setValue:@"my string value" forInputKey:@"inputString"];
    
    [myQCView setValue:[NSNumber numberWithInt:75] forInputKey:@"inputNumber"];
    
    CIColor * color = [CIColor colorWithRed:0.5 green:0.9 blue:0.9 alpha:1.0];
    [myQCView setValue:color forInputKey:@"inputColor"];
    
    
    NSImage * imgsource = [NSImage imageNamed:@"capture.png"];
    CIImage * img = [CIImage imageWithData:[imgsource TIFFRepresentation]];
    [myQCView setValue:img forInputKey:@"inputImage"];
    
    NSArray * arr = [NSArray arrayWithObjects:@"tata",@"tete",@"titi",@"tutu",@"toto", nil];
    [myQCView setValue:arr forInputKey:@"inputStructure"];
    
    myParams = [[QCCompositionParameterView alloc] initWithFrame:NSInsetRect([self.windowForParameters.contentView frame], 10, 10)];
    [myParams setCompositionRenderer:myQCView];
    [self.windowForParameters.contentView addSubview:myParams];
    
    [myQCView setEventForwardingMask:NSAnyEventMask];
    
    [myQCView addObserver:self forKeyPath:@"patch.outputNumber.value" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void) observeValueForKeyPath:(NSString*)keyPath
                       ofObject:(id)object
                         change:(NSDictionary*)change
                        context:(void*)context
{
    if ([keyPath isEqualToString:@"patch.outputNumber.value"])
    {
        int val = [[myQCView valueForOutputKey:@"outputNumber"] intValue];
        NSLog(@"%@ = %d", keyPath, val);
    }
}


@end
