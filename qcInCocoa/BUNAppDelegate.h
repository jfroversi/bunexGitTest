//
//  BUNAppDelegate.h
//  qcInCocoa
//
//  Created by minibun on 08/03/2014.
//  Copyright (c) 2014 minibun. All rights reserved.
//

//edited in github ! 06/04/2013

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>


@interface BUNAppDelegate : NSObject <NSApplicationDelegate>
{
    QCView * myQCView;
    QCCompositionParameterView * myParams;
    
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *windowForParameters;

@end
