//
//  SendClass.m
//  TestForce
//
//  Created by Carlos Cheung on 6/20/15.
//  Copyright (c) 2015 TestForce. All rights reserved.
//

#import "SendClass.h"
#import "SFRestAPI.h"

@implementation SendClass
+(void)doThatThing:(id)obj withDelegate:(id)delegate{
    [[SFRestAPI sharedInstance] send:obj delegate:delegate];
}
@end
