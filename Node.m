//
//  Node.m
//  WhereAmI
//
//  Created by cm2y on 2/6/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import "Node.h"

@implementation Node


-(void)addNode:(Node *)node {
    if (self.next == nil) {
        self.next = node;
    } else {
        //recursive
        [self.next addNode:node];
    }
}



@end

