////list holds on to the head node, all other nodes hold on to each other
//
//  LinkedList.h
//  WhereAmI
//
//  Created by cm2y on 2/6/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"


@interface LinkedList : NSObject


//need a pointer to the head of linked list
@property (strong,nonatomic) Node *head;


//need a pointer to end of list
@property (strong,nonatomic) Node *tail;


//need a way to insert node in the list
-(void)insertValue:(NSInteger)value;


@end


