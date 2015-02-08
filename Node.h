//
//  Node.h
//  WhereAmI
//
//  Created by cm2y on 2/6/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import <Foundation/Foundation.h>



//to create a node object
@interface Node : NSObject


//declare the node
@property (strong, nonatomic) Node *next;


//and the value type it holds
@property (nonatomic) NSInteger data;



//constructor method
-(void)addNode:(Node*)node;



@end










