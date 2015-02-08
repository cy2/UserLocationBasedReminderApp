//
//  LinkedList.m
//  WhereAmI
//
//  Created by cm2y on 2/6/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//





#import "LinkedList.h"

@implementation LinkedList


-(void)insertAtHead:(Node*)node {
    node.next = self.head;
    self.head = node;
}


-(void)insertValue:(NSInteger)value {
    
    //create a new node
    Node *node = [Node new];
    
    //add value to node
    node.data = value;
    
    //check if head of linked list is equal to nill
    if (self.head == nil) {

        
        self.head = node;
        self.tail = node;

    } else {
        
        //make head the new node
        [self insertAtHead:node];
    }
}




-(void)insertAtEnd:(Node*)node {
    
    [self.head addNode:node];
}





-(void)insertAtEndWithWhile:(Node *)node {
    
    Node *nextNode = self.head;
    
    //travrse linked list, find the end
    while (nextNode.next != nil) {
    
        //when it has a nill next -> insert at end of list
        nextNode = nextNode.next;
    
    }
    
    nextNode.next = node;
}


@end



//addNode()

//if my next pointer is nill
//insert value in next spot

//else

//version 1: traverse the list recursivly
//call the method insiide the method, checking the exit condition

//version 2:
//use a while loop instead


//insertAtEnd()


//insertAtHead()
//put value at from and insert the head


//insertAtEndWithWhileLoop()

//if head is not nill

//create a nextNode make = self.head value

//while next node.next != nill{
//traverse the list
//if nextNode = nextNode.next
//}
//nextNode.next = node

//}


